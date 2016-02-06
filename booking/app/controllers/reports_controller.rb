class ReportsController < ApplicationController

  def index
  end

  def show
    @start_date = Date.civil(params[:start_date][:year].to_i,
                  params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    @end_date = Date.civil(params[:end_date][:year].to_i,
                params[:end_date][:month].to_i, params[:end_date][:day].to_i)

    @visits = Visit.where(  'start_date BETWEEN ? AND ?', @start_date, @end_date)
    @total_inc = total_income(@visits)



  end

  private

    def total_income(visits)
      sum = 0
      visits.each do |v|
        sum += v.income
      end
      sum
    end

end
