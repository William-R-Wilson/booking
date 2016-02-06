class CostingDecorator

  def initialize(visit)
    @visit = visit
    #@labor_hour = 15
    #@total_labor_hours = @visit.hours_count
    #@total_labor_cost = total_labor_hours * @labor_hour
    #@supplies_plate = 7.41
    #@total_meals = @visit.breakfast_count + @visit.lunch_count + @visit.dinner_count

    #@vacation_accrual = @total_labor_cost * 0.1
    #@payroll_tax_rate = 0.0765
    #@total_payroll_cost = @total_labor_cost + @vacation_accrual + @payroll_taxes
    #@cost_total = @total_payroll_cost + total_supplies_cost
  end

  def supplies_plate
    7.41
  end

  def labor_hour_rate
    15
  end

  def payroll_tax_rate
    0.0765
  end

  def total_labor_hours
    @visit.hours_count
  end

  def total_labor_cost
    total_labor_hours * labor_hour_rate
  end

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