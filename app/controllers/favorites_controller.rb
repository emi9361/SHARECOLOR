class FavoritesController < ApplicationController
	def sound_create
	sound = Sound.find(params[:sound_id])
    favorite = current_user.favorites.new(sound_id: sound.id)
    favorite.save
    redirect_to sound_path(sound)
	end

	def sound_destroy
	sound = Sound.find(params[:sound_id])
    favorite = current_user.favorites.find_by(sound_id: sound.id)
    favorite.destroy
    redirect_to sound_path(sound)
    end

    def video_create
    video = Video.find(params[:video_id])
    favorite = current_user.favorites.new(video_id: video.id)
    favorite.save
    redirect_to video_path(video)
    end

    def video_destroy
    video = Video.find(params[:video_id])
    favorite = current_user.favorites.find_by(video_id: video.id)
    favorite.destroy
    redirect_to video_path(video)
    end

    def stage_create
    stage = Stage.find(params[:stage_id])
    favorite = current_user.favorites.new(stage_id: stage.id)
    favorite.save
    redirect_to stage_path(stage)
    end

    def stage_destroy
    stage = Stage.find(params[:stage_id])
    favorite = current_user.favorites.find_by(stage_id: stage.id)
    favorite.destroy
    redirect_to stage_path(stage)
    end


end
