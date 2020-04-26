require 'rails_helper'

RSpec.describe 'Keeps', type: :request do
  context 'ログインしている場合' do
  end
  
  context 'ログインしていない場合' do
    describe 'GET #index' do
      it 'リクエストが成功したか' do
        get keeps_index_path
        expect(response).to have_http_status(302)
      end
    end
  
    describe 'GET #create' do
      it 'リクエストが成功したか' do
        post keeps_path
        expect(response).to have_http_status(302)
      end
    end
  
    describe 'GET #destroy' do
      it 'リクエストが成功したか' do
        delete keeps_path
        expect(response).to have_http_status(302)
      end
    end
  end
end
