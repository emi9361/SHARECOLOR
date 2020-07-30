class SoundsController < ApplicationController
  def index
  	@sounds = Sound.all

  end

  def show
  	@sound = Sound.find(params[:id])
  end

  def edit
    @sound = Sound.find(params[:id])
  end

  def new
  	@sound = Sound.new
  end

  def create
  	@sound = Sound.new(sound_params)
  	@sound.user_id = current_user.id
  	@sound.save
  	redirect_to sounds_path,notice:'Upできたお〜'
  end

  def sound_for
  @sound= Sound.find(params[:id])
  send_data(@sound.upload_file, type: 'audio/mp3')
  end

  def hashtag
    @user = current_user
    @hashtag = Hashtag.find_by(hashtag_word: params[:name])
    @sounds = @hashtag.sounds.page(params[:page]).per(10).reverse_order
    @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.sounds.count}
  end

  private

  def sound_params
    #複数一括で登録するからhashtag_ids: []と記載
    params.require(:sound).permit(:file, :title, :bpm, :mood, :genre, :hashbody, :detail, hashtag_ids: [])
  end

end
