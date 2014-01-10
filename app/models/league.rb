class League < ActiveRecord::Base
  has_many :teams

  validates :name, presence: true
  validates :day, presence: true
end
