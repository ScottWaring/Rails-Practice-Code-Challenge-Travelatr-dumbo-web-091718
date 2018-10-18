class PostsController < ApplicationController
  before_action :set_path!, only: [:add_likes, :show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @output = @post.cleanup_post
  end

  def new
    @post = Post.new
  end

  def add_likes
    @post.likes += 1
    @post.save
    redirect_to post_path(@post)
  end

  def create
    @post = Post.create(post_params)

    if @post.valid?
      @post.likes = 0
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_path!
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end
