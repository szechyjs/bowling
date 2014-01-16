class League < ActiveRecord::Base
  has_many :teams

  validates :name, presence: true
  validates :start_date, presence: true

  def day
    start_date.strftime("%A")
  end

  def to_s
    name
  end

  def percentage_decimal
    percentage / 100.0
  end
end
