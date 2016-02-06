class ReportingDecorator

  def initialize(visits)
    visits = visits
    @all_visits = visits.each do |v|
      CostingDecorator.new(v)
    end
  end

  private

    def sum_labor_hours(visits)
      sum = 0
      visits.each do |visit|
        sum += visit.hours_count
      end
      sum
    end
end
