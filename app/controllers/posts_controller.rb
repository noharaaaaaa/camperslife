class PostsController < ApplicationController

  before_action :post_find, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order("created_at DESC")
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
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    if params[:post][:image_ids]
      params[:post][:image_ids].each do |image_id|
        image = post.images.find(image_id)
        image.purge
      end
    end
    if post.update_attributes(posts_params)
      flash[:success] = "編集しました"
      redirect_to posts_url
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
