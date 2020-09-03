require 'rails_helper'

RSpec.describe 'Videoモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
  	let(:user) { create(:user) }

    it 'Videoを保存できること' do
        video = video.new()
        video.user_id = user.id
        video.title = 'example title'
        file_path = File.join(Rails.root, 'spec/files/hands.mp4')
        video.file = Rack::Test::UploadedFile.new(file_path)
        expect(video.valid?).to eq true
    end

	it 'titleが空欄の時、保存できないこと' do
		video = video.new()
        video.user_id = user.id
        video.title = ''
        file_path = File.join(Rails.root, 'spec/files/hands.mp4')
        video.file = Rack::Test::UploadedFile.new(file_path)
		expect(video.valid?).to eq false
	end

  end
end