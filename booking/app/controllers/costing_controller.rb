class CostingController < ApplicationController

  def show
    @visit = Visit.find(params[:id])
    @labor_hour = 15
    @total_labor_hours = @visit.hours_count
    @total_labor_cost = @total_labor_hours * @labor_hour
    @supplies_plate = 7.41
    @total_meals = @visit.breakfast_count + @visit.lunch_count + @visit.dinner_count
    @total_supplies_cost = @total_meals * @supplies_plate
    @vacation_accrual = @total_labor_cost * 0.1
    @payroll_taxes = @total_labor_cost * 0.0765
    @total_payroll_cost = @total_labor_cost + @vacation_accrual + @payroll_taxes
    @cost_total = @total_payroll_cost + @total_supplies_cost
  end

  def edit
    @day = Day.find(params[:id])
    @employees = Employee.all
    @schedules = Schedule.where(day_id: @day.id)
  end

  def update # this method has been made useless by adding schedules. 
    @day = Day.find(params[:id])
    visit = @day.visit_id
    respond_to do |format|
      if @day.update(costing_params)
        flash[:success] = "Hours updated for #{@day.date}"
        format.html { redirect_to edit_hours_path(@day) }
      else
        flash[:warning] = "Failed to update hours"
        format.html {render :edit }
      end
    end
  end

  def create  # this method has been made useless by adding schedules.
    @day = Day.find(params[:id])
    visit = @day.visit_id
    respond_to do |format|
      if @day.save(costing_params)
        flash[:success] =  "Hours updated for #{@day.date}"
        format.html { redirect_to edit_hours_path(@day) }
      else
        flash[:warning] = "Failed to update hours"
        format.html {render :edit }
      end
    end
  end

    private

      def costing_params
        params.require(:day).permit(:id, :visit_id, :hours)
      end

end
