class CostingController < ApplicationController
  #require 'visit_costing'
  #include VisitCosting

  def show
    @visit = Visit.find(params[:id])
    @visit_costs = CostingDecorator.new(@visit)
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
