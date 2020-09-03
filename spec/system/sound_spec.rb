describe '投稿のテスト' do
	let(:user) { create(:user) }
	let!(:user2) { create(:user) }
	let!(:book) { create(:book, user: user) }
	let!(:book2) { create(:book, user: user2) }
	before do
		visit new_user_session_path
		fill_in 'user[name]', with: user.name
		fill_in 'user[password]', with: user.password
		click_button 'Log in'
	end
	describe 'サイドバーのテスト' do
		context '表示の確認' do
		it 'New bookと表示される' do
		expect(page).to have_content 'New book'
		end
		it 'titleフォームが表示される' do
		expect(page).to have_field 'book[title]'
		end
		it 'opinionフォームが表示される' do
		expect(page).to have_field 'book[body]'
		end
		it 'Create Bookボタンが表示される' do
		expect(page).to have_button 'Create Book'
		end
		it '投稿に成功する' do
			fill_in 'book[title]', with: Faker::Lorem.characters(number:5)
			fill_in 'book[body]', with: Faker::Lorem.characters(number:20)
			click_button 'Create Book'
			expect(page).to have_content 'successfully'
		end
		it '投稿に失敗する' do
			click_button 'Create Book'
			expect(page).to have_content 'error'
			expect(current_path).to eq('/books')
		end
	end
end