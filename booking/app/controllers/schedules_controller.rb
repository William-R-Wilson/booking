class SchedulesController < ApplicationController

  def get_dates
    #set dates for query or choose employee
    @employees = Employee.all
  end

  def by_employee
    @employee = Employee.find(params[:id])
    @schedules = Schedule.where(employee_id: @employee.id)
  end



  def index
    @start_date = Date.civil(params[:start_date][:year].to_i,
                  params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    @end_date = Date.civil(params[:end_date][:year].to_i,
                params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    @days = Day.where("date BETWEEN ? AND ?", @start_date, @end_date)
  end


  def new
    @schedule = Schedule.new(day_id: params[:day_id], employee_id: params[:employee_id])
    @worktypes = WorkType.all
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
    params.require(:schedule).permit(:day_id, :employee_id, :hours, :start_time, :end_time, :work_type_id)
  end


end
