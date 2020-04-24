require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = create(:post)
  end

  describe 'バリデーション presence: true' do
    context '全てのカラムに値が設定されている時' do
      it '全てのカラムの値が設定されていれば、OK' do
        expect(@post.valid?).to be_truthy
      end
    end

    context '空のカラムがある時' do
      it 'moneyが空だとNG' do
        @post.money = ''
        expect(@post.valid?).to be_falsey
      end

      it 'hourが空だとNG' do
        @post.hour = ''
        expect(@post.valid?).to be_falsey
      end

      it 'stationが空だとNG' do
        @post.station = ''
        expect(@post.valid?).to be_falsey
      end

      it 'locationが空だとNG' do
        @post.location = ''
        expect(@post.valid?).to be_falsey
      end

      it 'titleが空だとNG' do
        @post.title = ''
        expect(@post.valid?).to be_falsey
      end

      it 'descriptionが空だとNG' do
        @post.description = ''
        expect(@post.valid?).to be_falsey
      end
    end
  end

  describe 'バリデーション 255文字' do
    context '255文字以内の時' do
      it '全てのカラムの値が255文字以内であれば、OK' do
        expect(@post.valid?).to be_truthy
      end
    end

    context '255文字より大きい時' do
      it 'moneyが255文字より大きいとNG' do
        @post.money = 'a' * 256
        expect(@post.valid?).to be_falsey
      end

      it 'hourが255文字より大きいとNG' do
        @post.hour = 'a' * 256
        expect(@post.valid?).to be_falsey
      end

      it 'stationが255文字より大きいとNG' do
        @post.station = 'a' * 256
        expect(@post.valid?).to be_falsey
      end

      it 'locationが255文字より大きいとNG' do
        @post.location = 'a' * 256
        expect(@post.valid?).to be_falsey
      end

      it 'titleが255文字より大きいとNG' do
        @post.title = 'a' * 256
        expect(@post.valid?).to be_falsey
      end

      it 'descriptionが255文字より大きいとNG' do
        @post.description = 'a' * 256
        expect(@post.valid?).to be_falsey
      end
    end
  end
end
