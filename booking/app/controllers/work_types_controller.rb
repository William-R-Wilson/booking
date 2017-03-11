class WorkTypesController < ApplicationController
  load_and_authorize_resource

  def index
    @worktypes = WorkType.all
  end

  def new
    @worktype = WorkType.new
  end

  def create
    @worktype = WorkType.new(work_type_params)
    if @worktype.save
      flash[:success] = "New worktype #{@worktype.name} created"
      redirect_to work_types_path
    else
      flash[:warning] = "Failed to create new worktype"
      render "new"
    end
  end

  def edit
  end

  def destroy
    @worktype = WorkType.find(params[:id])
    @worktype.destroy
    respond_to do |format|
      flash[:warning] = "Worktype #{@worktype.name} destroyed"
      format.html { redirect_to work_types_path }
    end
  end

  private

    def work_type_params
      params.require(:work_type).permit(:name)
    end

end
