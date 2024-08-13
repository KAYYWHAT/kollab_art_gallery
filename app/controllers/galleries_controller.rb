class GalleriesController < ApplicationController
# before_action :autenticate_user!

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery =current_user.galleries.build(gallery_params)
    if @gallery.save
      if params[:gallery][:photo].present?
        uploaded_photo = Cloudinary::Uploader.upload(params[:gallery][:photo].tempfile)
        @gallery.update(photo: uploaded_photo['public_id'])
      end
      redirect_to @gallery, notice: 'Gallery was sucessfully created.'
    else
      render :new
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :descritption, :latitide, :longitude, :photos )
  end


end
