require 'rails_helper'

RSpec.feature 'Keeps', type: :feature do
  background do
    @user = create(:user)
    @post = create(:post_1)
  end 
  
  scenario 'キープできるか' do
    visit root_path

    click_link 'ログイン'

    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'

    expect(page).to have_content 'ログインしました。'

    click_link '求人一覧'

    expect do
      click_link '詳細を見る'
      click_on 'キープする'
      expect(page).to have_content 'キープに登録しました'
    end.to change(@user.keep_posts, :count).by(1)
  end

  scenario 'キープ削除できるか？' do
    visit root_path

    click_link 'ログイン'

    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'

    expect(page).to have_content 'ログインしました。'

    click_on '求人一覧'

    click_on '詳細を見る'

    click_on 'キープする'

    click_on 'キープ一覧'
    expect do
      click_on 'キープをやめる'
      expect(page).to have_content 'キープをやめました'
    end.to change(@user.keep_posts, :count).by(-1)
  end
end
