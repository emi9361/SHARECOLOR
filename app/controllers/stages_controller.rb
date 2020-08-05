class StagesController < ApplicationController
  def index
  	@stages = Stage.all
    videos = Video.all
    sounds = Sound.all

    sounds_suggest = sounds.map(&:hashbody).to_json.html_safe
    videos_suggest = videos.map(&:hashbody).to_json.html_safe
    stages_suggest = @stages.map(&:hashbody).to_json.html_safe

    @total_suggest = sounds_suggest + videos_suggest + stages_suggest

    #:hashbodyを取り出し、戻り値として配列で作成
    #stages.to_json #jsonファイルとして受け渡す
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

  def auto_complete
  #入力された値( params[:term])をもとにhashtagから探す処理を追加
  #一致したデータを先ほど同様mapメソッドで配列で取得してjsonファイル形式にしている流れ
  stages = Stage.select(:hashbody).where("hashbody like '%" + params[:term] + "%'").order(:hashbody)
  stages = stages.map(&:hashbody)
  render json: stages.to_json
  end

  private
  def stage_params
    params.require(:stage).permit(:file, :title, :genre, :hashbody, :detail, hashtag_ids:[])
  end
end