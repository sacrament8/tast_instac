class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy, :show]
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
      PostMailer.post_mail(@post).deliver
      redirect_to posts_path, notice: '投稿成功です、投稿完了メールをお送りしました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def show
    @like = current_user.likes.find_by(post_id: @post.id)
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: '投稿の編集に成功しました'
    else
      flash.now[:danger] = '入力に不備があります'
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '投稿削除に成功しました'
  end

  private

  def post_params
    params.require(:post).permit(:image, :content, :image_cache, :user_id)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end