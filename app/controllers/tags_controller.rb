class TagsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    # binding.pry
    @tag = Tag.find(params[:id])
  end

end
