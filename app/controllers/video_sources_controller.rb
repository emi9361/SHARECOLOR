class VideoSourcesController < ApplicationController

    def create
        sound = Sound.find(params[:sound_id])
        @video_source = current_user.video_sources.new(video_source_params)
        @video_sources = current_user.video_sources.order(updated_at: :desc).limit(1)
        @video_source.sound_id = sound.id
        if @video_source.save
            redirect_to sound_path(sound)
        else
            @sound = Sound.find(params[:sound_id])
            render :'sounds/show'
        end
    end

    def destroy
        VideoSource.find_by(id: params[:id], sound_id: params[:sound_id]).destroy
        redirect_to sound_path(params[:sound_id])
    end

    private

    def video_source_params
        params.require(:video_source).permit(:file)
    end
end
