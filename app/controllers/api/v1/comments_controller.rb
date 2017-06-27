module Api::V1
  class CommentsController < ApiController
    before_action :authenticate
    before_action :set_raffle

    def index
      @comments = @raffle.comments
    end

    def show
      @comment = Comment.find(params[:comment_id])
    end

    def create
      @comment = Comment.new(comment_params)
      @comment.user = @current_user
      @comment.raffle = @raffle
      @comment.save
      if params.has_key?(:comment_id)
        @response = Response.new(responded_id: params[:comment_id], response_id: @comment.id)
        @response.save
      end
    end

    private

      def set_raffle
        @raffle = Raffle.find(params[:raffle_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def comment_params
        params.require(:comment).permit(:content)
      end
  end
end
