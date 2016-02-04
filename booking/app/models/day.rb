class Day < ActiveRecord::Base
  belongs_to :visit
  has_many :schedules, dependent: :destroy
  validates_numericality_of :breakfast, :lunch, :dinner, :hh, :dorm, :lodge
  default_scope { order(date: :asc) }
  after_initialize :defaults

  def defaults
    self.hours = self.calculate_hours
    self.waive_facility_rental ||= false
  end

  def calculate_hours
    schedules = Schedule.where(day_id: self.id)
    total = 0
    schedules.each do |s|
      total += s.hours
    end
    total
  end




end
