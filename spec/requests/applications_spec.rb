require 'rails_helper'

RSpec.describe 'Applications', type: :request do
  context 'ログインしている場合' do
    describe 'GET #index' do
      login

      it 'リクエストが成功すること' do
        get applications_index_path
        expect(response).to have_http_status(200)
      end

      # it '全てのPostを取得する' do
      #   get applications_index_path
      #   expect(response.body).to include '新宿'
      #   expect(response.body).to include '横浜'
      # end
    end

    describe 'POST #create' do
      login
      before do
        @post = create(:post_2)
      end

      it 'リクエストが成功するか' do
        post applications_path, params: { post_id: @post.id }
        expect(response).to have_http_status(302)
      end

      it 'オブジェクトが増えること' do
        expect do
          post applications_path, params: { post_id: @post.id }
        end.to change(test.application_posts, :count).by(1)
      end

      it 'リダイレクトするか' do
        post applications_path, params: { post_id: @post.id }
        expect(response).to redirect_to post_path(id: @post.id)
      end
    end

    describe 'DELETE #destroy' do
      let(:test) { create(:test, :test_with_posts) }
      before do
        sign_in test
      end

      it 'リクエストが成功するか' do
        delete applications_path, params: { post_id: test.applications[0][:post_id] }
        expect(response).to have_http_status(302)
      end

      it 'オブジェクトが減ること' do
        expect do
          delete applications_path, params: { post_id: test.applications[0][:post_id] }
        end.to change(test.application_posts, :count).by(-1)
      end

      it 'リダイレクトするか' do
        delete applications_path, params: { post_id: test.applications[0][:post_id] }
        expect(response).to redirect_to applications_index_path
      end
    end
  end

  context 'ログインしていない場合' do
    describe 'GET #index' do
      it 'リダイレクトされるか' do
        get applications_index_path
        expect(response).to have_http_status(302)
      end
    end

    describe 'POST #create' do
      it 'リダイレクトされるか' do
        post applications_path
        expect(response).to have_http_status(302)
      end
    end

    describe 'DELETE #destroy' do
      it 'リダイレクトされるか' do
        delete applications_path
        expect(response).to have_http_status(302)
      end
    end
  end
end
