class ReportsController < ApplicationController

  def index
  end

  def show
    @start_date = Date.civil(params[:start_date][:year].to_i,
                  params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    @end_date = Date.civil(params[:end_date][:year].to_i,
                params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    @weeks_in_period = ((@end_date - @start_date)/7).to_f
    @cost = CostAmount.first
    @overhead_expense = overhead(@cost)
    @salary_expense = salary(@cost)
    @unassociated_days = Day.where( 'date BETWEEN ? AND ?', @start_date, @end_date).where(visit_id: nil)
    @unassociated_hours = unassociated_hours
    @unassociated_cost = unassociated_cost(@cost)
    @visits = Visit.where(  'start_date BETWEEN ? AND ?', @start_date, @end_date)
    @total_income = total_income(@visits)
    @data = ReportingDecorator.new(@visits)
    @total_labor = @unassociated_cost + @data.all_visit_labor_costs
    @labor_percent = (@total_labor/@total_income) * 100
    @supplies_percent = (@data.all_visit_supplies_costs/@total_income) * 100
  end

  private

    def unassociated_hours
      total = 0
      @unassociated_days.each do |day|
        total += day.calculate_hours
      end
      total
    end

    def unassociated_cost(c)
      total = 0
      @unassociated_days.each do |d|
        d.schedules.each do |s|
          total += s.cost
        end
      end
      (total * (c.payroll_tax + 1.0)) * 1.1  ## this one needs some work!
    end

    def overhead(c)
      (c.overhead/52) * @weeks_in_period
    end

    def salary(c)
      (c.salary/52) * @weeks_in_period
    end

    def total_income(visits)
      sum = 0
      visits.each do |v|
        sum += v.income
      end
      sum
    end

end
