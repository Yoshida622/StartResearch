require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'リクエストが成功すること' do
      get posts_index_path
      expect(response).to have_http_status(200)
    end

    # it '全てのPostを取得する' do
    #   FactoryBot.create_list(:post, 10)
    #   get posts_index_path
    #   json = JSON.parse(response.body)
    #   expect(json['post'].length).to eq(10)
    # end

    it '全てのPostを取得する' do
      FactoryBot.create :post
      FactoryBot.create :kanagawa
      get posts_index_path
      expect(response.body).to include '新宿'
      expect(response.body).to include '横浜'
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_post_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post posts_path, params: { post: FactoryBot.attributes_for(:post) }
        expect(response).to have_http_status(302)
      end

      it 'Postが登録されること' do
        expect do
          post posts_path, params: { post: FactoryBot.attributes_for(:post) }
        end.to change(Post, :count).by(1)
      end

      it 'リダイレクトすること' do
        post posts_path, params: { post: FactoryBot.attributes_for(:post) }
        expect(response).to redirect_to root_url
      end
    end

    context 'パラメータが不十分な場合' do
      it 'リクエストが成功すること' do
        post posts_path, params: { post: FactoryBot.attributes_for(:post, :invalid) }
        expect(response).to have_http_status(200)
      end

      it 'Postが登録されないこと' do
        expect do
          post posts_path, params: { post: FactoryBot.attributes_for(:post, :invalid) }
        end.not_to change(User, :count)
      end
    end
  end

  describe 'GET #show' do
    before do
      @post = create(:post)
    end
    it 'リクエストが成功すること' do
      get post_path(@post.id)
      expect(response).to have_http_status(200)
    end

    # it "特定のPostを取得する" do
    #   get post_path(@post.id)
    #   json = JSON.parse(response.body)
    #   expect(json['data']['title']).to eq(@post.title)
    # end

    it '特定のPostを取得する' do
      get post_path(@post.id)
      expect(response.body).to include '新宿'
    end
  end
end
