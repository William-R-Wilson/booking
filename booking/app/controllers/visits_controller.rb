class VisitsController < ApplicationController

  def new
    @visit = Visit.new
    @guest_options = Guest.all.map {|g| [g.name, g.id] }
    @statuses = Visit.statuses
  end

  def create
    @visit = Visit.new(visit_params)
    @guest_options = Guest.all.map {|g| [g.name, g.id] }
    @statuses = Visit.statuses
    #@status_options = @visit.status.map { |s| [s.name, s.id]}
    current_date = @visit.start_date #should be able to extract this to the model
    attending = @visit.num_attendees
    @visit.num_days.times do
      @visit.days.build(date: current_date, breakfast: attending, lunch: attending,
                      dinner: attending, dorm: attending, hh: 0, lodge: 0)
      current_date += 1
    end
    if @visit.save
      redirect_to visit_path(@visit), notice: "Visit created!"
    else
      flash.now
      render "new"
    end
  end

  def edit
    @visit = Visit.find(params[:id])
    @days = @visit.days
    @statuses = Visit.statuses
  end

  def update
    @visit = Visit.find(params[:id])
    @statuses = Visit.statuses
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to visit_path(@visit), notice: "Status updated" }
      else
        format.html { redirect_to visit_path(@visit), notice: "Status not updated!" }
      end
    end
  end

  def show
    @visit = Visit.find(params[:id])
    guest = Guest.where("guest_id = ?", @visit.guest_id)
    @days = @visit.days.order(date: :asc)
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
      params.require(:visit).permit(:guest_id, :num_attendees, :start_date,
                    :end_date, :status, :needs_projector, :needs_stafftime, :needs_childcare,
                    days_attributes: [:id, :breakfast, :lunch, :dinner, :dorm,
                    :hh, :lodge, :date])
    end

end
