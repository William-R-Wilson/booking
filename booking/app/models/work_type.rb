class WorkType < ActiveRecord::Base

  belongs_to :schedule

  validates :name, presence: true
  validates :name , uniqueness: true

end
