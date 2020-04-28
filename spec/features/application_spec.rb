require 'rails_helper'

RSpec.feature 'Applications', type: :feature do
  background do
    @user = create(:test)
    @post = create(:post)
  end

  scenario '申し込み' do
    visit root_path

    click_link 'ログイン'

    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'

    expect(page).to have_content 'ログインしました。'

    click_link '求人一覧'

    expect do
      click_link '詳細を見る'
      click_on '申し込む'
      expect(page).to have_content '申し込みが完了しました'
    end.to change(@user.application_posts, :count).by(1)
  end

  scenario '申し込みをキャンセルできるか？' do
    visit root_path

    click_link 'ログイン'

    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'

    expect(page).to have_content 'ログインしました。'

    click_on '求人一覧'

    click_on '詳細を見る'

    click_on '申し込む'

    click_on '申し込み一覧'
    expect do
      click_on '申し込みをキャンセル'
      expect(page).to have_content '申し込みをキャンセルしました'
    end.to change(@user.application_posts, :count).by(-1)
  end
end
