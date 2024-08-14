class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
  end

  private

  def application_params
    params.require(:application).permit(:status, :begin_date, :end_date)
  end
end
