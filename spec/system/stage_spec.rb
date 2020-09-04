require 'rails_helper'

describe '投稿のテスト' do
	let(:user) { create(:user) }
	let!(:user2) { create(:user) }
	let!(:sound) { create(:sound, user: user) }
	let!(:sound2) { create(:sound, user: user2) }
	before do
		visit new_user_session_path
		fill_in 'user[name]', with: user.name
		fill_in 'user[password]', with: user.password
		click_button 'Log in'
	end
	describe 'sound一覧ページのテスト' do
		context '表示の確認' do
		it 'Soundと表示される' do
		expect(page).to have_content 'Stage'
		end
		it 'titleが表示される' do
		expect(page).to have_content 'sound[Title]'
		end
		it 'usernameが表示される' do
		expect(page).to have_content 'sound[User]'
		end
		it 'BPMが表示される' do
		expect(page).to have_content 'sound[BPM]'
		end
		it 'genreが表示される' do
		expect(page).to have_content 'sound[Genre]'
		end
		it 'mp3プレーヤーが表示される' do
		expect(page).to have_button 'sound[file]'
		end
		it '投稿に成功する' do
			fill_in 'sound[title]', with: Faker::Lorem.characters(number:5)
			click_button 'アップロード'
			expect(page).to have_content 'successfully'
		end
		it '投稿に失敗する' do
			click_button 'アップロード'
			expect(page).to have_content 'error'
			expect(current_path).to eq('/stages')
		end
	end
end

