class GalleriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :apply]

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
    @application = @gallery.applications.new
  end

  def apply
    @gallery = Gallery.find(params[:id])
    @application = @gallery.applications.build(application_params.merge(user_id: current_user.id))

    if @application.save
      redirect_to @gallery, notice: 'Application was successfully created.'
    else
      render :show
    end
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_user.galleries.build(gallery_params)

    if @gallery.save
      redirect_to @gallery, notice: 'Gallery was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :address, :description, :price, photos: [])
  end

  def application_params
    params.require(:application).permit(:start_date, :end_date, :description, photos: []) # Adjust according to your model
  end
end
