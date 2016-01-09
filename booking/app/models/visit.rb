class Visit < ActiveRecord::Base
  belongs_to :guest
  has_one :price
  has_many :days, dependent: :destroy
  validates :num_attendees, presence: true, numericality: {less_than: 101 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  accepts_nested_attributes_for :days
  enum status: [:tentative, :confirmed, :billed, :paid]
  after_initialize :init_price

  def init_price #is this redundant in the controller?
    if self.price == nil
      p = Price.new(visit_id: self.id)
      p.save
    end
  end

  def num_days
    number_days = (end_date - start_date).to_i + 1
  end

  def breakfast_count
    total = 0
    self.days.each do |day|
      total += day.breakfast
    end
    total
  end

  def lunch_count
    total = 0
    self.days.each do |day|
      total += day.lunch
    end
    total
  end

  def dinner_count
    total = 0
    self.days.each do |day|
      total += day.dinner
    end
    total
  end

  def dorm_count
    total = 0
    self.days.each do |day|
      total += day.dorm
    end
    total
  end

  def hh_count
    total = 0
    self.days.each do |day|
      total += day.hh
    end
    total
  end

  def lodge_count
    total = 0
    self.days.each do |day|
      total += day.lodge
    end
    total
  end

  def hours_count
    total = 0
    self.days.each do |day|
      total += day.hours
    end
    total
  end

  def bf_income
    breakfast_count * self.price.breakfast
  end

  def lunch_income
    lunch_count * self.price.lunch
  end

  def din_income
    dinner_count * self.price.dinner
  end

  def dorm_income
    dorm_count * self.price.dorm
  end

  def hh_income
    hh_count * self.price.horton
  end

  def lodge_income
    lodge_count * self.price.lodge
  end

  def fac_income
    total = 0
    days.each do |day|
      unless day.waive_facility_rental?
        total += price.rentalfee
      end
    end
    total #need to add a field for meeting days, groups won't be meeting every day of the visit
  end                   #also need to add a way to reserve different meeting spaces

  def income  #this is going to need some refactoring but good enough to get cost function working
    bf_income + lunch_income + din_income + dorm_income + hh_income + lodge_income + fac_income
  end

end
