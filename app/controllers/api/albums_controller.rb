module Api
  class AlbumsController < ApiController


    def index
      @albums = current_user.albums.joins(:photos).group('albums.id').having('count(*) > 0')
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
      @album = Album.includes(:photos).find(params[:id])

      if @album.owner == current_user
        render :show
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
