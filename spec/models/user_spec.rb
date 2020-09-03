require 'rails_helper'

RSpec.describe User, type: :model do

	it "名前とメールアドレスとパスワードがあれば登録できる" do
	expect(FactoryBot.create(:user)).to be_valid
	end

	it "名前がなければ登録できない" do
		expect(FactoryBot.build(:user, name: "")).to_not be_valid
	end

	it "メールアドレスがなければ登録できない" do
		expect(FactoryBot.build(:user, email: "")).to_not be_valid
	end

	it "メールアドレスが重複していたら登録できない" do
		user1 = FactoryBot.create(:user,name: "first", email: "test@example.com")
		expect(FactoryBot.build(:user, name: "second", email: user1.email)).to_not be_valid
	end

	it "パスワードがなければ登録できない" do
		expect(FactoryBot.build(:user, password: "")).to_not be_valid
	end

	it "パスワードが暗号化されているか" do
		user = FactoryBot.create(:user)
		expect(user.password).to_not eq "password"
	end

	it "password_confirmationとpasswordが異なる場合保存できない" do
	expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid
	end

end