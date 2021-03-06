class QuestionsController < ApplicationController

 skip_before_action :logged_in?, only: [:index, :show]
 include VotesHelper

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params.merge(user: current_user))
    if @question.save
      @question.set_tags(@question.tag_string)
      redirect_to question_path(@question)
    else
      flash[:notice] = "You need to fill out both fields. Please try again"
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    redirect_to "/" unless @question.is_owned_by(current_user)
    if @question.update_attributes(question_params)
      @question.set_tags(@question.tag_string)
      redirect_to question_path
    else
      flash[:notice] = "Please try again"
      redirect_to edit_question_path
    end
  end

  def show
    @question = Question.find(params[:id])
    @comments = @question.comments
  end

  def index
    @questions = sort_by_votes(Question.all)
  end

  def vote
    vote = check_vote(vote_params)
    if vote.save
      redirect_to question_path(params[:vote][:question])
    else

      flash[:notice] =  "Sorry, your vote doesn't count"
      redirect_to question_path(params[:vote][:question])
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :tag_string)
  end

  def vote_params
    params.require(:vote).permit(:value).merge(user: current_user, voteable_id: params[:vote][:question], voteable_type: "Question")
  end

  def sort_by_votes(collection)
    collection.sort_by { |obj| obj.vote_count }.reverse
  end


end
