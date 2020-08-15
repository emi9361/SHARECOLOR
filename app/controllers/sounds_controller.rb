class SoundsController < ApplicationController

    def index
        @sounds = Sound.page(params[:page]).per(50).reverse_order
        users = User.all

        @sound_suggest = @sounds.map(&:title).concat(users.map(&:name)).to_json.html_safe
        @sound_search = Sound.search(params[:search])
        #videoとstageoの情報をmapで配列後k結合させる
        #オートコンプリートのリストに出したいもの,配列
    end

    def show
        @sound = Sound.find(params[:id])
        @video_source = VideoSource.new
        @video_sources = current_user.video_sources.order(updated_at: :desc).limit(1)
    end

    def edit
        @sound = Sound.find(params[:id])
    end

    def new
        @sound = Sound.new
    end

    def create
        @sound = Sound.new(sound_params)
        @sound.user_id = current_user.id
        if @sound.save
        redirect_to sounds_path,up_data:'SoundUpできたお〜'
        else
        render 'new'
        end
    end

    def update
        @sound = Sound.find_by(id: params[:id])
        if @sound.update(sound_params)
        redirect_to sounds_path,up_data:'SoundUpdateできたお〜'
        else
        render 'edit'
        end
    end

    def destroy
        @sound = Sound.find(params[:id])
        @sound.destroy
        redirect_to sounds_path,up_data:'Sound削除できたお〜'
    end


    def sound_for
        @sound= Sound.find(params[:id])
        send_data(@sound.upload_file, type: 'audio/mp3')
    end

    def hashtag
        @user = current_user
        @hashtag = Hashtag.find_by(hashtag_word: params[:name])
        @sounds = @hashtag.sounds.page(params[:page]).per(10).reverse_order
        @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.sounds.count}
    end

    def search
    #Viewのformで取得したパラメータをモデルに渡す
        @sounds = Sound.page(params[:page]).per(10).reverse_order
    end

    def auto_complete
    #入力された値( params[:term])をもとにhashtagから探す処理を追加
    #一致したデータを先ほど同様mapメソッドで配列で取得してjsonファイル形式にしている流れ
        sounds = Sound.select(:hashbody).where("hashbody like '%" + params[:term] + "%'").order(:hashbody)
        sounds = sounds.map(&:hashbody)
        render json: videos.to_json
    end


    private

    def sound_params
    #複数一括で登録するからhashtag_ids: []と記載
        params.require(:sound).permit(:file, :title, :bpm, :genre, :hashbody, :detail, hashtag_ids: [])
    end

end
