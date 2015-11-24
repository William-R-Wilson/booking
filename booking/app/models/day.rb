class Day < ActiveRecord::Base
  belongs_to :visit
  validates_numericality_of :breakfast, :lunch, :dinner, :hh, :dorm, :lodge
end
