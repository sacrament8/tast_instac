class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    @user = User.find_by(id: session[:user_id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: '会員登録に成功しました!ログインをしてみましょう!'
    else
      flash.now[:danger] = '会員登録に失敗しました、もう一度試みてください'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                :image, :image_cache, :profile)
  end
end
