module SoundsHelper
	def render_sound_hashtags(hashbody)
		#hashtagをクリックするとリンク先に飛ぶ
		hashbody.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/sound/hashtag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
	end
end
