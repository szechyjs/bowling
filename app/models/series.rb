class Series < ActiveRecord::Base
  belongs_to :bowler
  belongs_to :league
  belongs_to :team
  has_many :scores, :dependent => :destroy

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

end
