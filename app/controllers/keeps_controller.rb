class KeepsController < ApplicationController
  before_action :authenticate_user!

  def index
    @keep_posts = current_user.keep_posts
  end

  def create
    keep = current_user.keeps.build(post_id: params[:post_id])

    if keep.save
      redirect_to post_path(id: params[:post_id]), success: 'キープに登録しました'
    else
      redirect_to post_path(id: params[:post_id]), danger: 'キープに失敗しました'
    end
  end

  def destroy
    keep = Keep.find_by(user_id: current_user, post_id: params[:post_id])
    keep.destroy
    redirect_to keeps_index_path, success: 'キープをやめました'
  end
end
