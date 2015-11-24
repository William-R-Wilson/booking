class Visit < ActiveRecord::Base
  belongs_to :guest
  has_many :days
  validates :num_attendees, presence: true, numericality: {less_than: 101 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  accepts_nested_attributes_for :days

  def num_days
    number_days = (end_date - start_date).to_i + 1
  end

  def total_breakfast
    total = 0
    self.days.each do |day|
      total += day.breakfast
    end
    total
  end

  def total_lunch
    total = 0
    self.days.each do |day|
      total += day.lunch
    end
    total
  end

  def total_dinner
    total = 0
    self.days.each do |day|
      total += day.dinner
    end
    total
  end

  def total_dorm
    total = 0
    self.days.each do |day|
      total += day.dorm
    end
    total
  end

  def total_hh
    total = 0
    self.days.each do |day|
      total += day.hh
    end
    total
  end

  def total_lodge
    total = 0
    self.days.each do |day|
      total += day.lodge
    end
    total
  end
  
end
