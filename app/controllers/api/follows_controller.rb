module Api
  class FollowsController < ApiController

    def create

      follow = current_user.out_follows.new(followee_id: params[:followee_id])

      if follow.save
        render json: follow
      else
        render json: {}, status: :unprocessable_entity
      end

    end

    def destroy

      follow = current_user.out_follows.where(followee_id: params[:followee_id])
      follow.destroy
      render json: {}

    end
  end
end
