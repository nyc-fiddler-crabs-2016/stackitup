class CommentsController < ApplicationController
  def new
  end

  def create
    @question = Question.find_by(id: params[:comment][:commentable_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment created"
      redirect_to question_path(@question)
    else
      flash[:notice] = "Invalid Comment"
      redirect_to question_path(@question)
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type).merge(user:current_user)
  end
end
