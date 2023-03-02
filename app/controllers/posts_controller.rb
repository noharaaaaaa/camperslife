class PostsController < ApplicationController

  before_action :post_find, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(updated_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def update
    if params[:image_id].present?
      image = post.images&find(image_id)
      image.purge
    end
    if @post.update_attributes(posts_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def posts_params
    params.require(:post).permit(:title, :article, :place, :link, :price, :person_id, images:[]).
    merge(user_id: current_user.id)
  end

  def post_find
    @post = Post.find(params[:id])
  end


end
