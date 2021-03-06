class GuestsController < ApplicationController
  load_and_authorize_resource
  before_action :common_variables, only: [:new, :edit, :create]


  def common_variables
    @states = [ "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS",
                "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY",
                "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV",
                "WI", "WY"]
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      session[:guest] = @guest
      flash[:success] = "Added new guest #{@guest.name}"
      redirect_to new_visit_path
    else
      flash[:warning] = "Failed to add guest"
      render "new"
    end
  end

  def index
    @guests = Guest.paginate(page: params[:page], per_page: 15)
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    respond_to do |format|
      if @guest.update(guest_params)
        flash[:success] = "Info updated for #{@guest.name}"
        format.html { redirect_to guests_path }
      else
        flash[:warning] = "Failed to update #{@guest.name}"
        format.html {render :edit }
      end
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    if @guest.visits.any?
      flash[:warning] = "#{@guest.name} cannot be deleted"
      redirect_to guests_path
    else
      @guest.destroy
      flash[:warning] = "#{@guest.name} was deleted"
      redirect_to guests_path
    end
  end


  private

    def guest_params
      params.require(:guest).permit(:name, :bill_to, :email, :address, :address2, :telephone, :city, :state, :zip, :about)
    end

end
