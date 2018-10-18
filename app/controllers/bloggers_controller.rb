class BloggersController < ApplicationController
  before_action :set_path!, only: [:show, :edit, :update, :destroy]

  def index
    @bloggers = Blogger.all
  end

  def show
    @most_liked = @blogger.most_liked_post
    @like_count = @blogger.all_likes
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)
    if @blogger.valid?
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @blogger.update(blogger_params)
    redirect_to blogger_path(@blogger)
  end

  def destroy
    @blogger.destroy
    redirect_to bloggers_path
  end

  private

  def set_path!
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end
end
