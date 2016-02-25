class WorkType < ActiveRecord::Base

  has_many :schedules

  validates :name, presence: true
  validates :name , uniqueness: true

end
