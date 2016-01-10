class Price < ActiveRecord::Base

  has_many :visits
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
