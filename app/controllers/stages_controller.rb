class StagesController < ApplicationController
    before_action :set_stage, only: [:show, :edit, :update, :destroy]

    def index
        @stages = Stage.order(updated_at: :desc).page(params[:page]).per(5)
        users = User.all

        @stage_suggest = @stages.map(&:title).concat(users.map(&:name)).to_json.html_safe
        @stage_search = Stage.search(params[:search])
    #:hashbodyを取り出し、戻り値として配列で作成
    #stages.to_json #jsonファイルとして受け渡す
    end

    def show
    end

    def edit
    end

    def new
        @stage = Stage.new
    end

    def create
        @stage = Stage.new(stage_params)
        @stage.user_id = current_user.id
        if @stage.save
            redirect_to stages_path, up_data: 'StageにUpできたお〜'
        else
            render :new
        end
    end

    def update
        if @stage.update(stage_params)&& @stage.file.recreate_versions!
            redirect_to stages_path, up_data: 'StageUpdateできたお〜'
        else
            render :edit
        end
    end

    def destroy
        @stage.destroy
        redirect_to stages_path, up_data: 'Stage削除できたお〜'
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
        @stages = Stage.order(updated_at: :desc).page(params[:page]).per(5)
    end

    private
    def stage_params
        params.require(:stage).permit(:file, :title, :image, :genre, :hashbody, :detail, hashtag_ids:[])
    end

    def set_stage
        @stage = Stage.find(params[:id])
    end
end