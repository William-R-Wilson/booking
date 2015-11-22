class VisitsController < ApplicationController

  def new
    @visit = Visit.new
    @guest_options = Guest.all.map {|g| [g.name, g.id] }
  end

  def create
    @visit = Visit.new(visit_params)
    @guest_options = Guest.all.map {|g| [g.name, g.id] }
    if @visit.save
      redirect_to visit_path(@visit), notice: "Visit created!"
    else
      flash.now
      render "new"
    end
  end

  def edit_days
    @visit = Visit.find(params[:id])
  end

  def show
    @visit = Visit.find(params[:id])
    guest = Guest.where("guest_id = ?", @visit.guest_id)
  end

  def index
    @visits = Visit.all
    #guest = Guest.where("guest_id = ?", @visit.guest_id)
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: "Visit was deleted" }
    end
  end

  private

    def visit_params
      params.require(:visit).permit(:guest_id, :num_attendees, :start_date, :end_date)
    end

end
