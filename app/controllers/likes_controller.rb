class LikesController < ApplicationController
  def create
    like = current_user.likes.create(post_id: params[:post_id])
    redirect_to posts_url, notice: "#{like.post.user.name}さんの投稿をお気に入り登録しました"
  end
  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to posts_url, notice: "#{like.post.user.name}さんのブログをお気に入り解除しました"
  end
end