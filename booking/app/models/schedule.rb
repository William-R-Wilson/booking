class Schedule < ActiveRecord::Base
  belongs_to :day
  belongs_to :employee
  belongs_to :work_type
  before_create :set_hours
  before_update :set_hours
  #VALID_TIME = /\d?\d:\d\d\s[ap]m/
  #validates :start_time, format: { with: VALID_TIME }
  #validates :end_time, format: { with: VALID_TIME }
  validate :start_before_end

  def cost
    self.employee.hourly * self.hours
  end


  def set_hours
    self.hours = ((self.end_time - self.start_time)/3600).to_f
  end

  def start_before_end
    if start_time.present? && start_time > end_time
      errors.add(:start_time, "cannot come after end time")
    end
  end

  def date
    day.date
  end

end
