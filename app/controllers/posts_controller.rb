class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿成功'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:image, :content, :image_cache)
  end
end
