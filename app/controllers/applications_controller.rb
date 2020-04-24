class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @application_posts = current_user.application_posts
  end

  def create
    application = current_user.applications.build(post_id: params[:post_id])

    if application.save
      redirect_to post_path(id: params[:post_id]), success: '申し込みが完了しました'
    else
      redirect_to post_path(id: params[:post_id]), danger: '申し込みできませんでした'
    end
  end

  def destroy
    application = Application.find_by(user_id: current_user, post_id: params[:post_id])
    application.destroy
    redirect_to applications_index_path, success: '申し込みをキャンセルしました'
  end
end
