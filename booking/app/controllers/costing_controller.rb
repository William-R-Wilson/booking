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

  def edit
    @day = Day.find(params[:id])
  end

  def update
    @day = Day.find(params[:id])
    visit = @day.visit_id
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to costing_path(visit), notice: "Hours added for #{@day.date}"}
      else
        format.html {render :edit }
      end
    end
  end

    private

      def day_params
        params.require(:day).permit(:id, :visit_id, :hours)
      end

end
