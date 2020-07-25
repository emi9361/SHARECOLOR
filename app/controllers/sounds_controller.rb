class SoundsController < ApplicationController
  def index
  	@sounds = Sound.all

  end

  def show
  	@sound = Sound.find(params[:id])
    @video = Video.find(params[:id])
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

  private

  def sound_params
    params.require(:sound).permit(:file, :title, :bpm, :mood, :genre, :hashtag, :detail)
  end

end
