class Day < ActiveRecord::Base
  belongs_to :visit
  #before_create: assign_date


#assign a date to each day, based on the visit start date.
#might want to move this to the visits model or controller
  def assign_date
  end

end
