class PhotosController < ApplicationController
  def new
    @photo = Photo.new
    render 'new'
  end

end
