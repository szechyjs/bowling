class Team < ActiveRecord::Base
  belongs_to :league
  has_many :bowlers

  validates :name, presence: true
end
