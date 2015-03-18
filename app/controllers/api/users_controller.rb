module Api
  class UsersController < ApiController

    def show
      @user = User.find(params[:id])
      render json: @user

    end

    def following
      @following = current_user.followees
      render json: @following
    end

    def followers
      @followers = current_user.followers
      render json: @followers
    end

  end
end
