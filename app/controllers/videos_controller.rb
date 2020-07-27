class VideosController < ApplicationController
  def index
  	@videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
    @sound_sample = Sound.new
    @sound_source = Sound.find(params[:id])
  end

  def edit
    @video = Video.find(params[:id])
  end

  def new
  	@video = Video.new
  end

  def create
  	@video = Video.new(video_params)
  	@video.user_id = current_user.id
  	@video.save
  	redirect_to videos_path,notice:'Upできたお〜'
  end

  def update
    @video = Video.find(params[:id])
    @video.user_id = current_user.id
    Video.update(video_params)
    redirect_to videos_path,notice:'Upできたお〜'
  end

  private

  def video_params
    params.require(:video).permit(:file, :title, :mood, :genre, :hashtag, :detail)
  end

end
