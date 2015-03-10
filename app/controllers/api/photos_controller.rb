module Api
  class PhotosController < ApiController

    def index
      @photos = current_user.photos
      render json: @photos
    end

    def create
      @photo = current_user.photos.new(photo_params)
      if @photo.save
        render json: @photo
      else
        render json: @photo.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @photo = Photo.find(params[:id])

      if @photo.allowed?(current_user)
        render json: @photo
      else
        render json: ["You do not have permission to view this photo"],
                      status: 403
      end

    end

    def edit
      @photo = current_user.photos.find(params[:id])
      @photo.update(photo_params)
      if @photo.save
        render json: @photo
      else
        render json: @photo.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @photo = current_user.photos.find(params[:id])
      @photo.try(:destroy)
      render json: {}
    end

    private
    def photo_params
      params.require[:photo].permit[:title]
    end

  end
end
