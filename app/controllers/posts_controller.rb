class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿成功'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private

  def post_params
    params.require(:post).permit(:image, :content, :image_cache, :user_id)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
