class CalendarController < ApplicationController

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @visits = Visit.where start_date: (@date.beginning_of_month)..(@date.end_of_month)
    @visit_dates = get_days(@visits)
  end

  def show_schedules
  end


  def get_days(items)
    days = {}
    items.each do |i|
      i.days.each do |d|  #item must have days associated
        day = d.date
        days[day] ||= []
        days[day] << i
      end
    end
    days
  end




end
