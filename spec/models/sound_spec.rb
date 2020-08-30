require 'rails_helper'

RSpec.describe 'Soundモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
  	let(:user) { create(:user) }

    it 'Soundを保存できること' do
        sound = Sound.new()
        sound.user_id = user.id
        sound.title = 'example title'
        file_path = File.join(Rails.root, 'spec/files/rabbit-techno.mp3')
        sound.file = Rack::Test::UploadedFile.new(file_path)
        expect(sound.valid?).to eq true
    end

	it 'titleが空欄の時、保存できないこと' do
		sound = Sound.new()
        sound.user_id = user.id
        sound.title = ''
        file_path = File.join(Rails.root, 'spec/files/rabbit-techno.mp3')
        sound.file = Rack::Test::UploadedFile.new(file_path)
		expect(sound.valid?).to eq false
	end

  end
end