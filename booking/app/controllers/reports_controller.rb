class ReportsController < ApplicationController

  def index
  end

  def show
    @start_date = Date.civil(params[:start_date][:year].to_i,
                  params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    @end_date = Date.civil(params[:end_date][:year].to_i,
                params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    @weeks_in_period = ((@end_date - @start_date)/7).to_f
    @overhead_expense = overhead
    @salary_expense = salary
    @visits = Visit.where(  'start_date BETWEEN ? AND ?', @start_date, @end_date)
    @total_income = total_income(@visits)
    @data_for_visits = ReportingDecorator.new(@visits)
  end

  private

    def overhead
      (61613/52) * @weeks_in_period
    end

    def salary
      (47780/52) * @weeks_in_period
    end

    def total_income(visits)
      sum = 0
      visits.each do |v|
        sum += v.income
      end
      sum
    end

end
