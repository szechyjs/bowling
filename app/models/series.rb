class Series < ActiveRecord::Base
  belongs_to :bowler
  belongs_to :league
  belongs_to :team
  has_many :scores, :dependent => :destroy

  validates :bowler, presence: true

  accepts_nested_attributes_for :scores, allow_destroy: true

  def league_series?
    league && week > 0
  end

  def total
    sum = 0
    scores.each do |score|
      sum += score.score
    end
    sum
  end

  def average
    total / scores.count
  end
end
