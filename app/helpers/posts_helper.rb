module PostsHelper

  def new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_posts_path
    elsif action_name == 'edit'
      post_path
    end
  end

  def ensure_correct_user
    unless @post.user_id == current_user.id
      flash[:danger] = "不正なアクセスです、個人ページにリダイレクトします。"
      redirect_to user_path(current_user)
    end
  end
  
end