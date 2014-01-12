class League < ActiveRecord::Base
  has_many :teams

  validates :name, presence: true
  validates :day, presence: true

  def day
    start_date.strftime("%A")
  end

  def to_s
    name
  end
end
