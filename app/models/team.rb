class Team < ActiveRecord::Base
  belongs_to :league
  has_many :bowlers

  validates :name, presence: true

  def to_s
    name
  end
end
