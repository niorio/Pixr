module Api
  class AlbumsController < ApiController


    def index
      @albums = current_user.albums
      render json: @albums
    end

    def create
      @album = current_user.albums.new(album_params)
      if @album.save
        render json: @album
      else
        render json: @album.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @album = current_user.albums.find(params[:id]).includes(:photos)

      if @album
        render json: @album
      else
        render json: ["You do not have permission to view this album"],
                      status: 403
      end
    end

    def edit
      @album = current_user.albums.find(params[:id])
      @albums.update(album_params)
      if @albums.save
        render json: @album
      else
        render json: @album.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @album = current_user.albums.find(params[:id])
      @album.try(:destroy)
      render json: {}
    end

    private
    def photo_params
      params.require[:album].permit[:title]
    end





  end
end
