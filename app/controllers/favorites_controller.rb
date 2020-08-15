class FavoritesController < ApplicationController
    def sound_create
        @sound = Sound.find(params[:sound_id])
        favorite = current_user.favorites.new(sound_id: @sound.id)
        favorite.save
        @sound.create_notification_like!(current_user)
        respond_to :js
    end

    def sound_destroy
        @sound = Sound.find(params[:sound_id])
        favorite = current_user.favorites.find_by(sound_id: @sound.id)
        favorite.destroy
    end

    def video_create
        @video = Video.find(params[:video_id])
        favorite = current_user.favorites.new(video_id: @video.id)
        favorite.save
        @video.create_notification_like!(current_user)
        respond_to :js
    end

    def video_destroy
        @video = Video.find(params[:video_id])
        favorite = current_user.favorites.find_by(video_id: @video.id)
        favorite.destroy
    end

    def stage_create
        @stage = Stage.find(params[:stage_id])
        favorite = current_user.favorites.new(stage_id: @stage.id)
        favorite.save
        @stage.create_notification_like!(current_user)
        respond_to :js
    end

    def stage_destroy
        @stage = Stage.find(params[:stage_id])
        favorite = current_user.favorites.find_by(stage_id: @stage.id)
        favorite.destroy
    end
end