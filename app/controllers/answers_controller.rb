class AnswersController < ApplicationController
  require 'pry'
  def new
    @question = Question.find(parms[:id])
  end

  def create
    answer = Answer.new(body: params[:answers][:body], user: current_user, question_id: params[:answers][:question_id])
    if answer.save
      redirect_to question_path(answer.question)
    else
      flash[:notice] = "Something went wrong saving your answer."
      render 'answers/show'
    end
  end

  def updated
  end

  def edit
  end

  def destroy
  end

end
