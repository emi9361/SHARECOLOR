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

  def hashtag
    @user = current_user
    @hashtag = Hashtag.find_by(hashtag_word: params[:name])
    @stages = @hashtag.stages.pages([:page]).per(10).reverse_order
    @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.stages.count}
  end

  private
  def stage_params
    params.require(:stage).permit(:file, :title, :mood, :genre, :hashbody, :detail, hashtag_ids:[])
  end
end