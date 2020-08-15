class SoundSourcesController < ApplicationController
    def create
        video = Video.find(params[:video_id])
        @sound_source = current_user.sound_sources.new(sound_source_params)
        @sound_sources = current_user.sound_sources.order(updated_at: :desc).limit(1)
        @sound_source.video_id = video.id
        if @sound_source.save
            redirect_to video_path(video)
        else
            @video = Video.find(params[:video_id])
            render :'videos/show'
        end
    end

    def destroy
        SoundSource.find_by(id: params[:id], video_id: params[:video_id]).destroy
        redirect_to video_path(params[:video_id])
    end

    def sound_source_params
        params.require(:sound_source).permit(:file)
    end

end
