module Api
  class CommentsController < ApiController

    def create
      @comment = current_user.comments.new(comment_params)
      if @comment.save!
        render 'show'
      else
        render json: {}
      end
    end

    def destroy
      @comment = current_user.comments.find(params[:id])
      @comment.destroy
      render json: {}
    end

    def edit
    end

    private
    def comment_params
      params.require(:comment).permit(:body, :photo_id)
    end

  end
end
