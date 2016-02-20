class CostAmount < ActiveRecord::Base
  validates :overhead, :salary, :plate_cost, :payroll_tax, presence: true


end
