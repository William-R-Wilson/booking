class Employee < ActiveRecord::Base
  has_many :schedules
end
