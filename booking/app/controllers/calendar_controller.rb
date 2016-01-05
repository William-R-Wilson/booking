class CalendarController < ApplicationController

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @visits = Visit.where start_date: (@date.beginning_of_month)..(@date.end_of_month)
    @visit_dates = @visits.group_by(&:start_date)
  end

end
