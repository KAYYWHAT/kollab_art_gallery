class PagesController < ApplicationController
  def home
    @galleries = Gallery.all
    @user = current_user
  end
end
