class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    if params[:question]
      @question = Question.find_by(id: params[:question])
    elsif params[:answer]
      @answer = Answer.find_by(id: params[:answer])
    end
  end

  def create
    @question = Question.find_by(id: params[:comment][:question_id])
    @answer = Answer.find_by(id: params[:comment][:answer_id])
    @comment = Comment.new(comment_params)
    if @question
      if @comment.save
        flash[:notice] = "Comment created"
        redirect_to question_path(@question)
      else
        flash[:notice] = "Invalid Comment"
        redirect_to question_path(@question)
      end
    elsif @answer
      if @comment.save
        flash[:notice] = "Comment created"
        redirect_to question_path(@answer.question.id)
      else
        flash[:notice] = "Invalid Comment"
        redirect_to question_path(@answer.question.id)
      end
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type).merge(user:current_user)
  end
end
