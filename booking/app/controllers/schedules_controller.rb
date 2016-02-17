class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
  end


  def new
    @schedule = Schedule.new(day_id: params[:day_id], employee_id: params[:employee_id])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @start_time = params[:start_time]
    @end_time = params[:end_time]
    #@hours = @end_time - @start_time.to_i
    if @schedule.save
      flash[:success] = "Added new schedule for #{@schedule.employee.full_name} on #{@schedule.day.date}"
      redirect_to edit_hours_path(@schedule.day_id)
    else
      flash[:warning] = "Failed to add schedule"
      render "new"
    end
  end


  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update(schedule_params)
        flash[:success] = "Schedule for #{@schedule.employee.full_name} on #{@schedule.day.date} upated"
        format.html { redirect_to edit_hours_path(@schedule.day_id)}
      else
        flash[:warning] = "Failed to update schedule"
        render "edit"
      end
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    respond_to do |format|
      flash[:warning] = "Schedule for #{@schedule.employee.full_name} on #{@schedule.day.date} was deleted"
      format.html { redirect_to edit_hours_path(@schedule.day_id) }
    end
  end


private
  def schedule_params
    params.require(:schedule).permit(:day_id, :employee_id, :hours, :start_time, :end_time)
  end


end
