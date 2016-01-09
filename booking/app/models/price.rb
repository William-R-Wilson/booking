class Price < ActiveRecord::Base
  #created but not tied in to any other code at this point
  #need to figure out how to add to existing visits without breaking anything

  belongs_to :visit
  after_initialize :init

  def init
    puts "setting prices!"
    self.breakfast ||= 10.0
    self.lunch ||= 12.0
    self.dinner ||= 14.0
    self.dorm ||= 45.0
    self.horton ||= 60.0
    self.lodge ||= 60.0
    self.rentalfee ||= 150.0
  end

end
