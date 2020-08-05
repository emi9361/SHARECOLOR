class SearchController < ApplicationController

 def search
 	@model = params["search"]["model"]
 	@content = params["search"]["content"]
 	@method = params["search"]["method"]
 	@records = search_for(@model, @content, @method)
 end

  private
  def search_for(model, content, method)
    if model == 'sound'
		if method == 'perfect'
		Sound.where(hashbody: content)
		else
		Sound.where('hashbody LIKE ?', '%'+content+'%')
		end
    elsif model == 'video'
		if method == 'perfect'
		Video.where(hashbody: content)
		else
		Video.where('hashbody LIKE ?', '%'+content+'%')
		end
	elsif model == 'stage'
		if method == 'perfect'
		Stage.where(hashbody: content)
		else
		Stage.where('hashbody LIKE ?', '%'+content+'%')
	    end
	end
	end
end
