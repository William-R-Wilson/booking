class DaysController < ApplicationController

  def edit
    @day = Day.find(params[:id])
  end

  def index

  end

  private

    def day_params
      params.require(:day).permit(:visit_id, :breakfast,
                  :lunch, :dinner, :dorm, :hh, :lodge, :date)
    end

end
