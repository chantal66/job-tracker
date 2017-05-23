class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]
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

  def edit
  end

  def update
    @tag.update(tag_params)

    redirect_to tags_path
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end