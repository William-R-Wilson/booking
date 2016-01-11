class VisitsController < ApplicationController

  #before_action :set_visit, only: [:update, :show, :destroy, :edit]

  #def set_visit
  #  @visit = Visit.find(params[:id])
  #end

  def new
    @visit = Visit.new
    @guest_options = Guest.all.map { |g| [g.name, g.id] }
    @statuses = Visit.statuses
  end

  def create
    @visit = Visit.new(visit_params)
    createDays(@visit)
    if @visit.save
      @visit.init_price
      redirect_to visit_path(@visit), notice: "Visit for #{@visit.guest.name} created!  Pricing id: #{@visit.price.id} created"
    else
      flash.now  #?
      render "new"
    end
  end

  #def edit
  #  @visit = Visit.find(params[:id])
  #  @days = @visit.days
  #  @guest_options = Guest.all.map { |g| [g.name, g.id] }

  #  @statuses = Visit.statuses
  #  guest = Guest.where("guest_id = ?", @visit.guest_id)
  #end

  def update
    @visit = Visit.find(params[:id])
    @statuses = Visit.statuses
    @guest_options = Guest.all.map { |g| [g.name, g.id] }
    #the code block below doesn't capture the new start_date, so it just rebuilds the
    #days using the original start_date.

    #try to capture new start day with Visit.find(params[:start_date]) and see if that works

    #current_date = @visit.start_date #should be able to extract this to the model
    #attending = @visit.num_attendees
    #@visit.days.destroy_all
    #@visit.num_days.times do
    #  @visit.days.build(date: current_date, breakfast: attending, lunch: attending,
    #                  dinner: attending, dorm: attending, hh: 0, lodge: 0)
    #  current_date += 1
    #end
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to visit_path(@visit), notice: "Visit updated" }
      else
        format.html { redirect_to visit_path(@visit), notice: "Visit not updated!" }
      end
    end
  end

  def show
    @visit = Visit.find(params[:id])
    guest = Guest.where("guest_id = ?", @visit.guest_id)
    @days = @visit.days
  end

  def index
    @visits = Visit.all.order(start_date: :asc)
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
                    :hh, :lodge, :date, :waive_facility_rental])
    end

    def createDays(visit)
      current_date = visit.start_date #should be able to extract this to the model
      attending = visit.num_attendees
      visit.num_days.times do
        visit.days.build(date: current_date, breakfast: attending, lunch: attending,
                        dinner: attending, dorm: attending, hh: 0, lodge: 0)
        current_date += 1
      end
    end
end
