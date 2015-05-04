class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @animal = @tag.animals
  end

  def new
    @tag = Tag.new
  end

  def create
    # render :json => tag_params
    if Tag.find_by_name(params[:tag][:name])
      flash[:danger] = 'Tag is already in the database!'
      redirect_to new_tag_path
    else
      @tag = Tag.create(tag_params)
      redirect_to :tags
    end
  end

  def destroy
    @tags = Tag.all
    # render :json => @tags
    @tag = Tag.find(params[:id])
    @tags_length = @tag.animals.length
    if @tags_length != 0
      flash[:danger] = 'Cannot delete this tag, there are animals under it!'
      redirect_to :tags
    else
      @tag.destroy
      redirect_to :tags
    end
  end


  def tag_params
    params.require(:tag).permit(:name)
  end
end
