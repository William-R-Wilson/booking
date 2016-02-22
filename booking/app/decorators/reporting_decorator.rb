class ReportingDecorator

  def initialize(visits)
    @visits = visits
    @visit_costs = create_costs(@visits)
  end

  def create_costs(visits)
    arr = []
    visits.each do |v|
      x = CostingDecorator.new(v)
      arr.push(x)
    end
    arr
  end

  def total_visit_costs
    sum = 0
    @visit_costs.each do |v|
      sum += v.cost_total
    end
    sum
  end

  def all_visit_labor_costs
    sum = 0
    @visit_costs.each do |v|
      sum += v.total_labor_cost
    end
    sum * 1.1 * 1.0765  #needs work
  end

  def all_visit_supplies_costs
    sum = 0
    @visit_costs.each do |v|
      sum += v.total_supplies_cost
    end
    sum
  end


  def all_visits
    @visits
  end

  def all_visit_hours
    sum = 0
    @visits.each do |v|
      sum += v.hours_count
    end
    sum
  end

  def all_visits_cost
  end


end
