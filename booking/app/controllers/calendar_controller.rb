class CalendarController < ApplicationController

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @visits = Visit.where start_date: (@date.beginning_of_month)..(@date.end_of_month)
    @visit_dates = @visits.group_by(&:start_date) #currently just shows the start dates on the calendar
                                                  # you can pass a block to group_by

  end

  def get_days(visits)  #this method is an attempt to show all days for a visit instead of just the start dates
    visit_days = {}     # the trick is that visits can overlap dates
    visits.each do |v|
      vids = []
      v.days.each do |d| #this is only going to include days for the current visit
        unless vids.include? v.id  #how do I push add'l visit days into a particular date?
          vids.push(v.id)
        end
        visit_days[d.date] = vids
      end
    end
    visit_days
  end


end
