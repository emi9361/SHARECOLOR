module StagesHelper
	def render_with_hashtags(hashbody)
		#hashtagをクリックするとリンク先に飛ぶ
		hashbody.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/stage/hashtag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
	end
end
