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
        format.html { redirect_to visit_path(visit), notice: "Day was successfully updated" }
      else
        format.html { render :edit }
      end
    end
  end


  def index

  end

  private

    def day_params
      params.require(:day).permit(:id, :visit_id, :breakfast,
                  :lunch, :dinner, :dorm, :hh, :lodge, :date)
    end

end