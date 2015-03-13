module Api
  class PhotosController < ApiController

    def index
      @photos = current_user.photos
      render 'index'
    end

    def create
      @photo = current_user.photos.new(photo_params)

      if params[:photo][:new_album_name]
        album = current_user.albums.new(title: params[:photo][:new_album_name])
        @photo.album = album
      end

      if @photo.save
        render json: @photo
      else
        render json: @photo.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @photo = Photo.includes(:comments).find(params[:id])

      if @photo.allowed?(current_user)
        render 'show'
      else
        render json: ["You do not have permission to view this photo"],
                      status: 403
      end

    end

    def update
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
      params.require(:photo).permit(:title, :description, :img, :album_id)
    end

  end
end
