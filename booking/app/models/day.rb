class Day < ActiveRecord::Base
  belongs_to :visit
  validates_numericality_of :breakfast, :lunch, :dinner, :hh, :dorm, :lodge
  default_scope { order(date: :asc) }
  after_initialize :defaults

  def defaults
    self.hours ||= 24
  end


end
