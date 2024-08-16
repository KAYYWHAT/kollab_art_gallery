class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @applications = Application.all
    @user = current_user
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
    @gallery = Gallery.find(params[:gallery_id])
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])

    if current_user.id == @gallery.user_id
      flash[:alert] = "You can't reserve your own gallery"
      redirect_to new_gallery_application_path(@gallery) # Redirect back to the form
    else
      @application = Application.new(application_params)
      @application.gallery_id = @gallery.id
      @application.user_id = current_user.id
      @application.status = "pending"

      if @application.save
        flash[:notice] = "Your application was successful"
        redirect_to user_applications_path(current_user)
      else
        flash[:alert] = "There was an error with your application"
        render :new
      end
    end
  end

  def update
    p "hey"
    @application = Application.find(params[:id])
    @application.update(application_params)
    render json: { status: application_params[:status] }
  end

  private

  # def set_gallery
  #   @gallery = Gallery.find(params[:gallery_id])
  # end

  def application_params
    params.require(:application).permit(:status, :start_date, :end_date, :description, photos: [])
  end
end
