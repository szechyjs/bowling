class Bowler < ActiveRecord::Base
  has_and_belongs_to_many :teams

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  def short_name
    "#{first_name} #{last_name}"
  end

  def name
    if nickname.blank?
      short_name
    else
      "#{short_name} (#{nickname})"
    end
  end

  def to_s
    short_name
  end
end
