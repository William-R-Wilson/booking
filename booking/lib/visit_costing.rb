module VisitCosting

#methods that have to do with money we spend go here


  def supplies_plate
    7.00
  end

  def labor_hour_rate
    15
  end

  def payroll_tax_rate
    0.0765
  end

  def total_labor_hours(visit)
    visit.hours_count
  end

  def labor_cost(visit)
    total_labor_hours(visit) * labor_hour_rate
  end

  def supplies_cost(visit)
    visit.total_meals * supplies_plate
  end





end
