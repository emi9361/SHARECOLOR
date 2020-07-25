class StagesController < ApplicationController
  def index
  	@stages = Stage.all
  end

  def show
  	@stage = Stage.find(params[:id])
  end

  def edit
  	@stage = Stage.find(params[:id])
  end

  def new
  	@stage = Stage.new
  end

  def create
    @stage = Stage.new(stage_params)
    @stage.user_id = current_user.id
    @stage.save
    redirect_to stages_path, notice:'Upできたお〜'
  end

  private
  def stage_params
    params.require(:stage).permit(:file, :title, :mood, :genre, :hashtag, :detail)
  end
end