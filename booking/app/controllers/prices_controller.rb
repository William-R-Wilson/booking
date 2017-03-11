class PricesController < ApplicationController
  load_and_authorize_resource
  def index
    @prices = Price.all
  end

  def new
    @price = Price.new
  end

  def create
    @price = Price.new(price_params)
    if @price.save
      flash[:success] = "Price #{@price.tier} created"
      redirect_to prices_path
    else
      flash[:warning] = "Failed to create Price"
      render "new"
    end
  end

  def edit
    @price = Price.find(params[:id])
  end

  def update
    @price = Price.find(params[:id])
    respond_to do |format|
      if @price.update(price_params)
        flash[:success] = "Price #{@price.tier} updated"
        format.html { redirect_to prices_path }
      else
        flash[:warning] = "Price not updated"
        format.html {redirect_to edit_price_path(@price)}
      end
    end
  end


  def destroy
    @price = Price.find(params[:id])
    @price.destroy
    respond_to do |format|
      flash[:warning] = "Price #{@price.tier} deleted"
      format.html { redirect_to prices_path }
    end
  end


  private

    def price_params
      params.require(:price).permit(:breakfast, :lunch, :dinner, :dorm, :horton, :lodge, :rentalfee, :tier)
    end


end
