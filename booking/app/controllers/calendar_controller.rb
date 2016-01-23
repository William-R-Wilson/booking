class CalendarController < ApplicationController

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @visits = Visit.where start_date: (@date.beginning_of_month)..(@date.end_of_month)
    @visit_dates = get_days(@visits)
  end

  def get_days(visits)
    visit_days = {}
    visits.each do |v|
      v.days.each do |d|
        day = d.date
        visit_days[day] ||= []
        visit_days[day] << v
      end
    end
    visit_days
  end


end
