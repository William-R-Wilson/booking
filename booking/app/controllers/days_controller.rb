class DaysController < ApplicationController

  def edit
    @visit = Visit.find(params[:id])
    @days = @visit.days
  end

  def index
    @visit = Visit.find(params[:id])
    @days = @visit.days
  end

  private

    def day_params
      params.require(:day).permit(:visit_id, :breakfast,
                  :lunch, :dinner, :dorm, :hh, :lodge)
    end

end
