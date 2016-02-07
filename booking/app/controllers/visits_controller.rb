class VisitsController < ApplicationController

  def new
    @visit = Visit.new
    @guest_options = Guest.all.map { |g| [g.name, g.id] }
    @statuses = Visit.statuses
    @tier_options = Price.all.map { |p| [p.tier] }
  end

  def create
    @visit = Visit.new(visit_params)
    @guest_options = Guest.all.map { |g| [g.name, g.id] }
    @tier_options = Price.all.map { |p| [p.tier] }
    @statuses = Visit.statuses
    createDays(@visit)
    if @visit.save
      #@visit.init_price
      flash[:success] = "Visit for #{@visit.guest.name} created!"
      redirect_to visit_path(@visit)
    else
      flash[:warning] = "Failed to create visit"
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
    @tier_options = Price.all.map { |p| [p.tier] }
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
        flash[:success] = "Visit updated for #{@visit.guest.name}"
        format.html { redirect_to visit_path(@visit) }
      else
        flash[:warning] = "Visit for #{@visit.guest.name}not updated"
        format.html { redirect_to visit_path(@visit) }
      end
    end
  end

  def show
    @visit = Visit.find(params[:id])
    guest = Guest.where("guest_id = ?", @visit.guest_id)
    @days = @visit.days
    @tier_options = Price.all.map { |p| [p.tier] }
  end

  def index
    @visits = Visit.all.order(start_date: :asc)
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    respond_to do |format|
      flash[:warning] = "Visit for #{@visit.guest.name} was deleted"
      format.html { redirect_to visits_url }
    end
  end

  private

    def visit_params
      params.require(:visit).permit(:guest_id, :num_attendees, :start_date,
                    :end_date, :status, :needs_projector, :needs_stafftime,
                    :needs_childcare, :price_tier, :notes, :purpose,
                    :agreement_signed, :deposit_received, 
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
