require 'rails_helper'

RSpec.describe 'Stageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
  	let(:user) { create(:user) }

    it 'Stageを保存できること' do
        stage = stage.new()
        stage.user_id = user.id
        stage.title = 'example title'
        file_path = File.join(Rails.root, 'spec/files/rabbit-techno.mp3')
        stage.file = Rack::Test::UploadedFile.new(file_path)
        expect(stage.valid?).to eq true
    end

	it 'titleが空欄の時、保存できないこと' do
		stage = stage.new()
        stage.user_id = user.id
        stage.title = ''
        file_path = File.join(Rails.root, 'spec/files/rabbit-techno.mp3')
        stage.file = Rack::Test::UploadedFile.new(file_path)
		expect(stage.valid?).to eq false
	end

  end
end