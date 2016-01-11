class Day < ActiveRecord::Base
  belongs_to :visit
  has_many :schedules
  validates_numericality_of :breakfast, :lunch, :dinner, :hh, :dorm, :lodge
  default_scope { order(date: :asc) }
  after_initialize :defaults

  def defaults
    self.hours ||= 24
    self.waive_facility_rental ||= false
  end


end
