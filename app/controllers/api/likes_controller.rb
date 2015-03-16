module Api
  class LikesController < ApiController

    def toggle
      like = Like.find_by(user: current_user, photo_id: params[:photo_id])
      if like
        like.destroy
        render json: {}
      else
        like = Like.new(user: current_user, photo_id: params[:photo_id])
        like.save
        render json: like
      end
    end

  end
end
