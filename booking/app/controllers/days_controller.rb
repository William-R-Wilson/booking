class DaysController < ApplicationController

  def edit
    @day = Day.find(params[:id])
    @visit = Visit.where("visit_id = ?", @day.visit_id)
    #@guest = Guest.where("id = ?", @visit.guest_id)
  end

  def update
    @day = Day.find(params[:id])
    visit = @day.visit_id
    respond_to do |format|
      if @day.update(day_params)
        flash[:success] = "Details for #{@day.date} successfully updated"
        format.html { redirect_to visit_path(visit) }
      else
        flash[:warning] = "Day failed to update"
        format.html { render :edit }
      end
    end
  end

  def new  #this would only be used to create days that are unassociated with any visit
    #this method will rely on hidden fields in the day/new view
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
    if @day.save
      flash[:success] = "Added new day #{@day.date} with no associated visit"
      redirect_to edit_hours_path(@day)
    else
      flash[:warning] = "Failed to add day"
      render "new"
    end
  end

  def index
    @days = Day.all
  end

  def day_visit(day)
    today = Day.find(day)
    if today.visit == nil
      return "No visit associated"
    else
      return today.visit.guest.name
    end
  end

  private
  

    def day_params
      params.require(:day).permit(:id, :visit_id, :breakfast,
                  :lunch, :dinner, :dorm, :hh, :lodge, :date, :waive_facility_rental)
    end

end
