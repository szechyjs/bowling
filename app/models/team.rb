class Team < ActiveRecord::Base
  belongs_to :league
  delegate :name, to: :league, prefix: true

  has_many :bowlers
  has_many :series

  validates :name, presence: true

  def to_s
    "#{name} - #{league}"
  end

  def stats
    series_ordered = series.order(:week).includes(:scores)

    return nil if series_ordered.empty?

    scratch_pins = 0
    high_game = Series.new
    high_game_pins = 0
    week = 0
    week = series_ordered.first.week
    high_series_pins = 0
    high_series_week = week
    series_pins = 0

    # loop the individual series
    series_ordered.each do |series|
      if week < series.week
        if series_pins > high_series_pins
          high_series_pins = series_pins
          high_series_week = week
        end
        series_pins = series.total
        week = series.week
      else
        series_pins += series.total
      end
      scratch_pins += series.total
      if series.total > high_game_pins
        high_game_pins = series.total
        high_game = series
      end
    end

    # check if the last team series is the highest
    if series_pins > high_series_pins
      high_series_pins = series_pins
      high_series_week = week
    end

    { scratch_pins: scratch_pins, high_game: high_game, high_series_pins: high_series_pins, high_series_week: high_series_week }
  end

  def series_scores
    series_ordered = series.order(:week).includes(:scores)

    return nil if series_ordered.empty?

    week = series_ordered.first.week
    scratch_pins = 0
    scores = []
    date = series_ordered.first.date
    series_ordered.each do |series|
      if week < series.week
        scores << [date, scratch_pins]
        scratch_pins = 0
        week = series.week
        date = series.date
      end
      scratch_pins += series.total
    end
    scores << [date, scratch_pins]
    scores
  end

  def bowler_stats
    stats = []
    bowlers.each do |bowler|
      avg = Series.average(bowler, self)
      handicap = Series.handicap(self, avg)
      scratch_game = 0
      scratch_series = 0
      series = Series.where(team: self, bowler: bowler).includes(:scores)
      series.each do |s|
        if s.high_game > scratch_game
          scratch_game = s.high_game
        end

        if s.total > scratch_series
          scratch_series = s.total
        end
      end

      stats << { name: bowler.name, handicap: handicap, average: avg,
                 scratch_game: scratch_game, scratch_series: scratch_series }
    end
    stats.sort_by { |stat| stat[:handicap] }
  end
end
