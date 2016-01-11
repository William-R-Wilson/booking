class EmployeesController < ApplicationController

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Employee #{@employee.full_name} created"
      redirect_to employee_path(@employee)
    else
      flash[:warning] = "Failed to create employee"
      render "new"
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def index
    @employees = Employee.all.order(last_name: :asc)
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    respond_to do |format|
      if @employee.update(employee_params)
        flash[:success] = "Employee #{@employee.full_name} updated"
        format.html { redirect_to employee_path(@employee) }
      else
        flash[:warning] = "Employee not updated"
        format.html { redirect_to edit_employee_path(@employee) }
      end
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      flash[:warning] = "Employee #{@employee.full_name} deleted"
      format.html { redirect_to employees_url }
    end
  end

  private

    def employee_params
      params.require(:employee).permit(:first_name, :last_name)
    end

end
