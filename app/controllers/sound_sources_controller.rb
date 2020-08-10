class SoundSourcesController < ApplicationController

    def create
        video = Video.find(params[:video_id])
        sound_source = current_user.sound_sources.new(sound_source_params)
        sound_source.video_id = video.id
        sound_source.save
        redirect_to video_path(video)
    end

    def destroy
        sound_source = SoundSource.find_by(id: params[:id], video_id: params[:video_id])
        binding.pry
        sound_source.destroy
        redirect_to video_path(params[:video_id])
    end

    def sound_source_params
        params.require(:sound_source).permit(:file)
    end

end
