class PostsController < ApplicationController
  def index
    @indexes = Post.all
    @posts =
      if params[:location].present?
        Post.where('location LIKE ?', "%#{params[:location]}%")
      end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_url, success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :money, :hour, :station, :location, :description)
  end
end
