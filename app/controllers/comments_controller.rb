class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [ :edit, :update, :destroy, :show ]
  before_action :set_submission

  def new
  end

  def create
    @comment = @submission.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to submission_path(@submission), notice: "Comment created successfully" }
      else
        format.turbo_stream
        format.html { redirect_to submission_path(@submission), alert: "Comment could not be created." }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream
        format.html { redirect_to submission_path(@submission), notice: "Comment updated successfully" }
      else
        format.turbo_stream
        format.html { redirect_to submission_path(@submission), alert: "Comment could not be updated." }
      end
    end
  end

  def destroy
  end

  def show
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:submission_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:reply, :submission_id)
    end
end
