module Api
  class PhotosController < ApiController

    def index
      @photos = Photo.includes(:likes).where(owner: current_user)
      render 'index'
    end

    def create
      @photo = current_user.photos.new(photo_params)

      if params[:photo][:new_album_name]
        album = current_user.albums.new(title: params[:photo][:new_album_name])
        @photo.album = album
      end

      @photo.parse_tags(params[:photo][:tags])

      if @photo.save
        render 'show'
      else
        render json: @photo.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @photo = Photo.includes(:comments, :tags, :owner).find(params[:id])

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

    def liked
      @photos = current_user.liked_photos
      render 'index'
    end

    def followed
      @photos = current_user.followed_photos
      render 'index'
    end

    def by_tag
      @photos = Tag.find(params[:id]).public_photos
      render 'index'
    end

    def search
      @photos = Photos.full_search(params[:query])
      render 'index'
    end

    private
    def photo_params
      params.require(:photo).permit(:title, :description, :img, :album_id, :private)
    end

  end
end
