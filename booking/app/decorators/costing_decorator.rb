class CostingDecorator

  def initialize(visit)
    @visit = visit
    @cost = CostAmount.first
  end

  def supplies_plate
    @cost.plate_cost
  end

  def total_labor_cost
    total = 0
    @visit.schedules.each do |s|
      total += s.cost
    end
    total
  end

  def payroll_tax_rate
    @cost.payroll_tax
  end

  def total_labor_hours
    @visit.hours_count
  end

  #def total_labor_cost
  #  total_labor_hours * labor_hour_rate
  #end

  def total_supplies_cost
    @visit.total_meals * supplies_plate
  end

  def vacation_accrual
    total_labor_cost * 0.1
  end

  def payroll_taxes
    total_labor_cost * payroll_tax_rate
  end


  def total_payroll_cost
    total_labor_cost + vacation_accrual + payroll_taxes
  end

  def cost_total
    total_payroll_cost + total_supplies_cost
  end

end
