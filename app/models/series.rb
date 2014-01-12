class Series < ActiveRecord::Base
  belongs_to :bowler
  belongs_to :league
  belongs_to :team

  validates :bowler, presence: true

  def league_series?
    league && week > 0
  end
end
