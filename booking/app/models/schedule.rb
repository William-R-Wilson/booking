class Schedule < ActiveRecord::Base
  belongs_to :day
  belongs_to :employee
  before_create :set_hours

  def set_hours
    self.hours = ((self.end_time - self.start_time)/3600).to_f
  end


end
