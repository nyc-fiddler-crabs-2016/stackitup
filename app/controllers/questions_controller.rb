class QuestionsController < ApplicationController

 skip_before_action :logged_in?, only: [:index, :show]

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @question = Question.find(params[:id])
    @comments = @question.comments
    @comment = Comment.new
  end

  def index
    @questions = Question.all
  end
end
