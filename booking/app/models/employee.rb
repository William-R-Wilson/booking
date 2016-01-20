class Employee < ActiveRecord::Base

  has_many :schedules
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    first_name + " " + last_name
  end

end
