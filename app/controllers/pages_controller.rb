class PagesController < ApplicationController
  def home
    @galleries = Gallery.all
  end
end
