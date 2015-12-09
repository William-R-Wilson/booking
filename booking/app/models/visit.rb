class Visit < ActiveRecord::Base
  belongs_to :guest
  has_many :days, dependent: :destroy
  validates :num_attendees, presence: true, numericality: {less_than: 101 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  accepts_nested_attributes_for :days
  enum status: [:tentative, :confirmed, :billed, :paid]

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

  def income  #this is going to need some refactoring but good enough to get cost function working
    bf = total_breakfast * 10
    lnch = total_lunch * 12
    din = total_dinner * 14
    dr = total_dorm * 45
    hort = total_hh * 60
    lod = total_lodge * 60
    fac = self.num_days * 150 #need to add a field for meeting days, groups won't be meeting every day of the visit
                              #also need to add a way to reserve different meeting spaces
    bf + lnch + din + dr + hort + lod + fac
  end

end
