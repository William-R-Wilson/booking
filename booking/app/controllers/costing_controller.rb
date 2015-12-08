class CostingController < ApplicationController

  def show
    @visit = Visit.find(params[:id])
    @labor_hour = 15
    @total_labor_hours = @visit.num_days * 16 #2 staff per day, 8 hour shifts each
    @total_labor_cost = @total_labor_hours * @labor_hour
    @supplies_plate = 7.41
    @total_meals = @visit.total_breakfast + @visit.total_lunch + @visit.total_dinner
    @total_supplies_cost = @total_meals * @supplies_plate
  end

end
