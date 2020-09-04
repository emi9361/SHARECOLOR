require 'rails_helper'

describe '投稿のテスト' do
	let(:user) { create(:user) }
	let!(:user2) { create(:user) }
	let!(:stage) { create(:stage, user: user) }
	let!(:stage2) { create(:stage, user: user2) }
	before do
		visit new_user_session_path
		fill_in 'user[name]', with: user.name
		fill_in 'user[password]', with: user.password
		click_button 'Log in'
	end
	describe 'stage一覧ページのテスト' do
		context '表示の確認' do
		it 'stageと表示される' do
		expect(page).to have_content 'Stage'
		end
		it 'titleが表示される' do
		expect(page).to have_content 'stage[Title]'
		end
		it 'usernameが表示される' do
		expect(page).to have_content 'stage[User]'
		end
		it 'mp4プレーヤーが表示される' do
		expect(page).to have_button 'stage[file]'
		end
		it '投稿に成功する' do
			fill_in 'stage[title]', with: Faker::Lorem.characters(number:5)
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

describe '編集のテスト' do

		context '自分の投稿の編集画面への遷移' do
		it '遷移できる' do
			visit edit_stage_path(stage)
			expect(current_path).to eq('/stages/' + stage.id.to_s + '/edit')
		end
	end
		context '他人の投稿の編集画面への遷移' do
		  it '遷移できない' do
		    visit edit_stage_path(stage2)
		    expect(current_path).to eq('/stages')
		  end
		end

		context '表示の確認' do
			before do
				visit edit_stage_path(stage)
			end
			it 'Video Editと表示される' do
				expect(page).to have_content('Stage Edit')
			end
			it 'title編集フォームが表示される' do
				expect(page).to have_field 'stage[タイトル]', with: stage.title
			end
			it 'Hashtagフォームが表示される' do
				expect(page).to have_field 'stage[ハッシュタグ]', with: stage.bpm
			end
			it 'detailフォームが表示される' do
				expect(page).to have_field 'stage[detail]', with: stage.detail
			end
			it 'stagefileフォームが表示される' do
				expect(page).to have_field 'vound[file]', with: stage.file
			end
			it 'アップロードボタンが表示される' do
				expect(page).to have_link 'アップロード', href: stages_path
			end
			it '戻るリンクが表示される' do
				expect(page).to have_link '戻る', href: stages_path
			end
		end

		context 'フォームの確認' do
			it '編集に成功する' do
				visit edit_video_path(stage)
				click_button 'アップデート'
				expect(page).to have_content 'successfully'
				expect(current_path).to eq '/stages/' + stage.id.to_s
			end
			it '編集に失敗する' do
				visit edit_stage_path(stage)
				fill_in 'stage[title]', with: ''
				click_button 'アップデート'
				expect(page).to have_content 'error'
				expect(current_path).to eq '/stages/' + stage.id.to_s
			end
		end
	end