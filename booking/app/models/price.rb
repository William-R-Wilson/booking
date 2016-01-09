class Price < ActiveRecord::Base
  belongs_to :visit
  after_initialize :defaults

  def defaults
    breakfast ||= 10.0
    lunch ||= 12.0
    dinner ||= 14.0
    dorm ||= 45.0
    horton ||= 60.0
    lodge ||= 60.0
    rentalfee ||= 150.0
  end

end
