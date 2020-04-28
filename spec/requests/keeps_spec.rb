require 'rails_helper'

RSpec.describe 'Keeps', type: :request do
  context 'ログインしている場合' do
    describe 'GET #index' do
      login

      it 'リクエストが成功すること' do
        get keeps_index_path
        expect(response).to have_http_status(200)
      end

      # it '全てのPostを取得する' do
      #   get applications_index_path
      #   expect(response.body).to include '新宿'
      #   expect(response.body).to include '横浜'
      # end
    end

    describe 'POST #create' do
      login_keep
      before do
        @post = create(:post_1)
      end

      it 'リクエストが成功するか' do
        post keeps_path, params: { post_id: @post.id }
        expect(response).to have_http_status(302)
      end

      it 'オブジェクトが増えること' do
        expect do
          post keeps_path, params: { post_id: @post.id }
        end.to change(user.keep_posts, :count).by(1)
      end

      it 'リダイレクトするか' do
        post keeps_path, params: { post_id: @post.id }
        expect(response).to redirect_to post_path(id: @post.id)
      end
    end

    describe 'DELETE #destroy' do
      let(:user) { create(:user, :user_with_posts) }
      before do
        sign_in user
      end

      it 'リクエストが成功するか' do
        delete keeps_path, params: { post_id: user.keeps[0][:post_id] }
        expect(response).to have_http_status(302)
      end

      it 'オブジェクトが減ること' do
        expect do
          delete keeps_path, params: { post_id: user.keeps[0][:post_id] }
        end.to change(user.keep_posts, :count).by(-1)
      end

      it 'リダイレクトするか' do
        delete keeps_path, params: { post_id: user.keeps[0][:post_id] }
        expect(response).to redirect_to keeps_index_path
      end
    end
  end

  context 'ログインしていない場合' do
    describe 'GET #index' do
      it 'リクエストが成功したか' do
        get keeps_index_path
        expect(response).to have_http_status(302)
      end
    end

    describe 'POST #create' do
      it 'リクエストが成功したか' do
        post keeps_path
        expect(response).to have_http_status(302)
      end
    end

    describe 'DELETE #destroy' do
      it 'リクエストが成功したか' do
        delete keeps_path
        expect(response).to have_http_status(302)
      end
    end
  end
end
