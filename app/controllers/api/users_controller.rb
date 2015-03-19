module Api
  class UsersController < ApiController

    def show
      @user = User.find(params[:id])
      render 'show'

    end

    def following
      @users = current_user.followees
      render 'index'
    end

    def followers
      @users = current_user.followers
      render 'index'
    end

  end
end
