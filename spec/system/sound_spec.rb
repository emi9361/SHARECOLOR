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
			fill_in 'sound[body]', with: Faker::Lorem.characters(number:20)
			click_button 'アップロード'
			expect(page).to have_content 'successfully'
		end
		it '投稿に失敗する' do
			click_button 'アップロード'
			expect(page).to have_content 'error'
			expect(current_path).to eq('/sounds')
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
			it 'Sounds Editと表示される' do
				expect(page).to have_content('Sounds Edit')
			end
			it 'title編集フォームが表示される' do
				expect(page).to have_field 'sound[タイトル]', with: sound.title
			end
			it 'Genre編集フォームが表示される' do
				expect(page).to have_field 'sound[Genre]', with: sound.genre
			end
			it 'Bpm編集フォームが表示される' do
				expect(page).to have_field 'sound[bpm]', with: sound.bpm
			end
			it 'Hashtagフォームが表示される' do
				expect(page).to have_field 'sound[hashtag]', with: sound.hashbody
			end
			it 'detailフォームが表示される' do
				expect(page).to have_field 'sound[detail]', with: sound.detail
			end
			it 'Soundfileフォームが表示される' do
				expect(page).to have_field 'sound[detail]', with: sound.file
			end
			it 'アップロードボタンが表示される' do
				expect(page).to have_link 'アップロード', href: sounds_path
			end
			it '戻るリンクが表示される' do
				expect(page).to have_link '戻る', href: sounds_path
			end
		end

		context 'フォームの確認' do
			it '編集に成功する' do
				visit edit_sound_path(sound)
				click_button 'アップデート'
				expect(page).to have_content 'successfully'
				expect(current_path).to eq '/sounds/' + sound.id.to_s
			end
			it '編集に失敗する' do
				visit edit_sound_path(sound)
				fill_in 'sound[title]', with: ''
				click_button 'アップデート'
				expect(page).to have_content 'error'
				expect(current_path).to eq '/sounds/' + sound.id.to_s
			end
		end
	end