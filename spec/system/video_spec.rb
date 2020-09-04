require 'rails_helper'

describe '投稿のテスト' do
	let(:user) { create(:user) }
	let!(:user2) { create(:user) }
	let!(:video) { create(:video, user: user) }
	let!(:video2) { create(:video, user: user2) }
	before do
		visit new_user_session_path
		fill_in 'user[name]', with: user.name
		fill_in 'user[password]', with: user.password
		click_button 'Log in'
	end
	describe 'video一覧ページのテスト' do
		context '表示の確認' do
		it 'タイトルがVideoと表示される' do
		expect(page).to have_content 'Videos'
		end
		it 'Titleが表示される' do
		expect(page).to have_field 'video[Title]'
		end
		it 'usernameが表示される' do
		expect(page).to have_field 'video[User]'
		end
		it 'mp4プレーヤーが表示される' do
		expect(page).to have_button 'video[file]'
		end
		it '投稿に成功する' do
			fill_in 'video[title]', with: Faker::Lorem.characters(number:5)
			click_button 'アップロード'
			expect(page).to have_content 'successfully'
		end
		it '投稿に失敗する' do
			click_button 'アップロード'
			expect(page).to have_content 'error'
			expect(current_path).to eq('/videos')
		end
	end
end
end