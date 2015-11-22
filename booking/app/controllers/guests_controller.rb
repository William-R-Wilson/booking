class GuestsController < ApplicationController
  before_action :common_variables


  def common_variables
    @states = [ "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS",
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
      redirect_to new_visit_path
    else
      render "new"
    end
  end

  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end


  private

    def guest_params
      params.require(:guest).permit(:name, :bill_to, :email, :address, :address2, :city, :state, :zip)
    end
end
