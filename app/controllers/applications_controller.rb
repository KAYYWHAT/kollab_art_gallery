class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @applications = Application.all
    @user = current_user
  end

  def show
    @application = Application.find(params[:id])
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])

    if current_user == @gallery.user_id
      flash[:alert] = "You can't reserve your own gallery"
    else
      @application = Application.new(application_params)
      @application.gallery_id = @gallery.id
      @application.user_id = current_user.id
      @application.status = "pending"
      @application.save

      flash[:alert] = "Your application was successful"
      # redirect_to galleries_path
    end
  end

  private

  # def set_gallery
  #   @gallery = Gallery.find(params[:gallery_id])
  # end

  def application_params
    params.require(:application).permit(:status, :start_date, :end_date)
  end
end
