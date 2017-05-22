class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new()
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save

    redirect_to tags_path
  end


  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end