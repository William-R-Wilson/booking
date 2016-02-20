class CostAmountController < ApplicationController

def edit
  @cost = CostAmount.find(params[:id])
end

def update
  @cost = CostAmount.find(params[:id])
  respond_to do |format|
    if @cost.update(cost_amount_params)
      flash[:success] = "Costs successfully updated"
      format.html { redirect_to admin_pages_path }
    else
      flash[:warning] = "Failed to update costs"
      format.html { render :edit }
    end
  end
end

private

  def set_cost
    if !CostAmount.any?
      CostAmount.new(overhead:25067.46, salary: 47780.00, payroll_tax: 0.0765, plate_cost: 7.41)
    else
      CostAmount.first
    end
  end

  def cost_amount_params
    params.require(:cost_amount).permit(:overhead, :salary, :payroll_tax, :plate_cost)
  end

end
