class StagesController < ApplicationController

    def index
        @stages = Stage.page(params[:page]).per(10).reverse_order
        users = User.all

        @stage_suggest = @stages.map(&:title).concat(users.map(&:name)).to_json.html_safe
        @stage_search = Stage.search(params[:search])
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

    def search
        @stages = Stage.page(params[:page]).per(10).reverse_order
    end

    private
    def stage_params
        params.require(:stage).permit(:file, :title, :image, :genre, :hashbody, :detail, hashtag_ids:[])
    end
end