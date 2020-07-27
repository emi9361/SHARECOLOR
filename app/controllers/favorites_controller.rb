class FavoritesController < ApplicationController


    def sound_create
	@sound = Sound.find(params[:sound_id])
    favorite = @sound.favorites.new(user_id: current_user.id)
    favorite.save
	end

	def sound_destroy
	@sound = Sound.find(params[:sound_id])
    favorite = current_user.favorites.find_by(sound_id: @sound.id)
    favorite.destroy
    end

    def video_create
    @video = Video.find(params[:video_id])
    favorite = @video.favorites.new(user_id: current_user.id)
    favorite.save
    end

    def video_destroy
    @video = Video.find(params[:video_id])
    favorite = current_user.favorites.find_by(video_id: @video.id)
    favorite.destroy
    end

    def stage_create
    @stage = Stage.find(params[:stage_id])
    favorite = @stage.favorites.new(user_id: current_user.id)
    favorite.save
    end

    def stage_destroy
    @stage = Stage.find(params[:stage_id])
    favorite = current_user.favorites.find_by(stage_id: @stage.id)
    favorite.destroy
    end
end