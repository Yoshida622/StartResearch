require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  background do
    @post = create(:post)
    @kanagawa = create(:kanagawa)
  end

  scenario '新規求人投稿をする。' do
    visit root_path

    click_link '新規求人投稿'

    fill_in 'タイトル', with: '1200'
    fill_in '時給', with: '12:00-17:00'
    fill_in '勤務時間', with: '新宿'
    fill_in '最寄駅', with: 'xx県yy市zz町1-2-3'
    fill_in '住所', with: '心理学実験'
    fill_in 'その他条件', with: '20才以上 女性'
    click_button '投稿'

    expect(page).to have_content '投稿に成功しました'
  end

  scenario 'エリア別検索できるか？' do
    visit posts_index_path

    fill_in 'ex)  東京都  新宿区', with: '東京都yy市zz町1-2-3'
    click_button '検索'

    expect(page).to have_content('心理学実験', count: 3)
  end
end
