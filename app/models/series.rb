class Series < ActiveRecord::Base
  belongs_to :bowler
  belongs_to :league
  belongs_to :team
  has_many :scores, -> { order("id ASC") }, :dependent => :destroy

  validates :bowler, presence: true

  accepts_nested_attributes_for :scores, allow_destroy: true

  def total
    sum = 0
    scores.each do |score|
      sum += score.score
    end
    sum
  end

  def average
    if games != 0
      total / games
    else
      0
    end
  end

  def games
    scores.count
  end

  def high_game
    scores.max_by(&:score).score
  end

  def handicap_games
    scores.where(absent: false).count
  end

  def handicap_total
    sum = 0
    scores.where(absent: false).each do |score|
      sum += score.score
    end
    sum
  end

  def handicap_average
    if handicap_games != 0
      handicap_total / handicap_games
    else
      0
    end
  end

  def handicap
    if Series.select(:id, :week).where(bowler: bowler, team: team).order(:week).first == self
      average = handicap_average
    else
      average = Series.average(bowler, team, week)
    end
    Series.handicap(team, average)
  end

  def self.average(bowler, team, week = nil)
    if week.nil?
      week = Series.select(:week).where(bowler: bowler, team: team).order(:week).last.week
    else
      week = week - 1
    end

    series = Series.where(bowler: bowler, week: 1..(week), team: team)
    games = series.map(&:handicap_games).inject(0, :+)
    total = series.map(&:handicap_total).inject(0.0, :+)
    (total / games).floor
  end

  def self.handicap(team, average)
    league = team.league
    hndcap = (league.basis - average) * league.percentage_decimal
    hndcap.floor
  end
end
