class CostingController < ApplicationController

  def show
    @visit = Visit.find(params[:id])
    @labor_hour = 15
    @total_labor_hours = @visit.total_hours #2 staff per day, 8 hour shifts each
    @total_labor_cost = @total_labor_hours * @labor_hour
    @supplies_plate = 7.41
    @total_meals = @visit.total_breakfast + @visit.total_lunch + @visit.total_dinner
    @total_supplies_cost = @total_meals * @supplies_plate
  end

  def edit
    @edit_hours = Day.find(params[:id])
  end

  def update
    @edit_hours = Day.find(params[:id])
    visit = @edit_hours.visit_id
    respond_to do |format|
      if @edit_hours.update(costing_params)
        format.html { redirect_to costing_path(visit), notice: "Hours added for #{@edit_hours.date}" }
      else
        format.html {render :edit }
      end
    end
  end

  def create
    @new_hours = Day.find(params[:id])
    visit = @new_hours.visit_id
    respond_to do |format|
      if @new_hours.save(costing_params)
        format.html { redirect_to costing_path(visit), notice: "Hours added for #{@new_hours.date}" }
      else
        format.html {render :edit }
      end
    end
  end

    private

      def costing_params
        params.require(:day).permit(:id, :visit_id, :hours)
      end

end
