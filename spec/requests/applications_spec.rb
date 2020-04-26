require 'rails_helper'

RSpec.describe 'Applications', type: :request do
  
  context 'ログインしている場合' do
    before do
    end
    
    describe 'GET #index' do
      it 'リクエストが成功すること' do
        get applications_index_path
        expect(response).to have_http_status(200)
      end
      
      it '全てのPostを取得する' do
        get applications_index_path
        expect(response.body).to include ''
        expect(response.body).to include ''
      end
    end
  
    describe 'GET #create' do
      before do
        FactoryBot.create(:user)
        FactoryBot.create(:post_2)
      end 

      it 'リクエストが成功するか' do
        post applications_path
        expect(response).to have_http_status(302)
      end
      
      it 'オブジェクトが増えること' do
        expect do
          post applications_path, params: { post: FactoryBot.attributes_for(:post_2) }
        end.to change(Post, :count).by(1)
      end
      
      it 'リダイレクトするか' do
        post applications_path
        expect(response).to redirect_to post_path(id: post_id)
      end
    end
    
    describe 'GET #destroy' do
      before do
      end
      
      it 'リクエストが成功するか' do
        delete applications_path
        expect(response).to have_http_status(302)
      end
      
      it 'オブジェクトが減ること' do
        expect do
          delete applications_path, params: { post: FactoryBot.attributes_for(:post_2) }
        end.to change(Post, :count).by(-1)
      end
      
      it 'リダイレクトするか' do
        delete applications_path
        expect(response).to redirect_to post_path(id: post_id)
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
  
    describe 'GET #create' do
      it 'リダイレクトされるか' do
        post applications_path
        expect(response).to have_http_status(302)
      end
    end
  
    describe 'GET #destroy' do
      it 'リダイレクトされるか' do
        delete applications_path
        expect(response).to have_http_status(302)
      end
    end
  end
end
