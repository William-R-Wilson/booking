class Visit < ActiveRecord::Base
  require 'visit_costing'
  include VisitCosting

  belongs_to :guest
  belongs_to :price
  has_many :days, dependent: :destroy
  has_many :schedules, through: :days
  validates :num_attendees, presence: true, numericality: {less_than: 501 }
  validates_presence_of :start_date, :end_date
  validate :check_dates
  accepts_nested_attributes_for :days
  enum status: [:tentative, :confirmed, :billed, :paid]
  after_initialize :init_price
  default_scope { order(start_date: :desc) }

  def init_price
    if self.price_tier == nil
      self.price_tier = "default"
    else
      price = Price.find_by(tier: self.price_tier)
      self.price_id = price.id
    end
    puts "Added price ID"
  end

  def total_costs
    @current_visit = CostingDecorator.new(self)
    @current_visit.cost_total
  end

  def total_meals
    breakfast_count + lunch_count + dinner_count
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


#this is commented out for now, was trying to move it from controller, not sure
# why it wasn't working
#  def createDays
#    current_date = self.start_date #should be able to extract this to the model
#    attending = self.num_attendees
#    self.num_days.times do
#      self.days.build(date: current_date, breakfast: attending, lunch: attending,
#                      dinner: attending, dorm: attending, hh: 0, lodge: 0)
#      current_date += 1
#    end
#  end

  def income
    bf_income + lunch_income + din_income + dorm_income + hh_income + lodge_income + fac_income
  end

  private

    def check_dates
      if end_date < start_date
        errors.add(:end_date, "cannot be before start date")
      end
    end

end
