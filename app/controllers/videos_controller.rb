class VideosController < ApplicationController

    def index
        @videos = Video.page(params[:page]).per(10).reverse_order
        users = User.all

        @video_suggest = @videos.map(&:title).concat(users.map(&:name)).to_json.html_safe
        @video_search = Video.search(params[:search])
    end

    def show
        @video = Video.find(params[:id])
        @sound_source = SoundSource.new
        @sound_sources = current_user.sound_sources.order(updated_at: :desc).limit(1)
    end

    def edit
        @video = Video.find(params[:id])
    end

    def new
        @video = Video.new
    end

    def create
        @video = Video.new(video_params)
        @video.user_id = current_user.id
        if @video.save
        redirect_to videos_path,notice:'VideoUpできたお〜'
        else
        render :new
        end
    end

    def update
        @video = Video.find(params[:id])
        @video.user_id = current_user.id
        if Video.update(video_params)&& @video.file.recreate_versions!
        redirect_to videos_path,notice:'VideoUpdateできたお〜'
        else
        render :edit
        end
    end

    def destroy
        @video = Video.find(params[:id])
        @video.destroy
        redirect_to videos_path,notice:'Sound削除できたお〜'
    end

    def hashtag
        @user = current_user
        @hashtag = Hashtag.find_by(hashtag_word: params[:name])
        @videos = @hashtag.videos.page(params[:page]).per(10).reverse_order
        @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.videos.count}
    end

    def auto_complete
        #入力された値( params[:term])をもとにhashtagから探す処理を追加
        #一致したデータを先ほど同様mapメソッドで配列で取得してjsonファイル形式にしている流れ
        videos = Video.select(:hashbody).where("hashbody like '%" + params[:term] + "%'").order(:hashbody)
        videos = videos.map(&:hashbody)
        render json: videos.to_json
    end

    def search
        @videos = Video.page(params[:page]).per(10).reverse_order
    end

    private
    def video_params
        params.require(:video).permit(:file, :title, :genre, :hashbody, :image, :detail,hashtag_ids: [])
    end

    end
