class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_raffle, only: [:show,
                                    :edit,
                                    :update,
                                    :destroy,
                                    :index,
                                    :new,
                                    :create]
  before_action :set_answered, only: [:new, :create]
  before_action :verify_user, only: [:edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.raffle_id = @raffle.id

    respond_to do |format|
      if @comment.save
        if params.has_key?(:comment_id)
          @response = Response.new(responded_id: params[:comment_id], response_id: @comment.id)
          @response.save
        end
        respond_to do |format|
          format.html { redirect_to raffle_path(id: @comment.raffle_id), notice: 'Comment was successfully created.' }
          format.json { render :show, status: :created, location: @comment }

        end
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to raffle_path(id: @comment.raffle_id), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to raffle_path(id: @comment.raffle_id), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def verify_user
      if !current_user?(@comment.user)
        respond_to do |format|
          format.html { redirect_to raffle_path(id: @comment.raffle_id), notice: 'Invalid Action' }
        end
      end
    end

    def set_raffle
      if params.has_key?(:raffle_id)
        @raffle = Raffle.find(params[:raffle_id])
      end
    end

    def set_answered
      if params.has_key?(:comment_id)
        @answered = Comment.find(params[:comment_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
