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

describe '編集のテスト' do

		context '自分の投稿の編集画面への遷移' do
		it '遷移できる' do
			visit edit_sound_path(sound)
			expect(current_path).to eq('/sounds/' + sound.id.to_s + '/edit')
		end
	end
		context '他人の投稿の編集画面への遷移' do
		  it '遷移できない' do
		    visit edit_sound_path(sound2)
		    expect(current_path).to eq('/sounds')
		  end
		end

		context '表示の確認' do
			before do
				visit edit_sound_path(sound)
			end
			it 'Video Editと表示される' do
				expect(page).to have_content('Video Edit')
			end
			it 'title編集フォームが表示される' do
				expect(page).to have_field 'video[タイトル]', with: video.title
			end
			it 'Hashtagフォームが表示される' do
				expect(page).to have_field 'video[ハッシュタグ]', with: video.bpm
			end
			it 'detailフォームが表示される' do
				expect(page).to have_field 'video[detail]', with: video.detail
			end
			it 'Videofileフォームが表示される' do
				expect(page).to have_field 'vound[file]', with: video.file
			end
			it 'アップロードボタンが表示される' do
				expect(page).to have_link 'アップロード', href: videos_path
			end
			it '戻るリンクが表示される' do
				expect(page).to have_link '戻る', href: videos_path
			end
		end

		context 'フォームの確認' do
			it '編集に成功する' do
				visit edit_video_path(video)
				click_button 'アップデート'
				expect(page).to have_content 'successfully'
				expect(current_path).to eq '/videos/' + video.id.to_s
			end
			it '編集に失敗する' do
				visit edit_video_path(video)
				fill_in 'video[title]', with: ''
				click_button 'アップデート'
				expect(page).to have_content 'error'
				expect(current_path).to eq '/videos/' + video.id.to_s
			end
		end
	end