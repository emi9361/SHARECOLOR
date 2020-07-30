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
		Sound.where(title: content)
		elsif method == 'forward'
		Sound.where('title LIKE ?', content+'%')
		elsif method == 'backward'
		Sound.where('title LIKE ?', '%'+content)
		else
		Sound.where('title LIKE ?', '%'+content+'%')
		end
    elsif model == 'video'
		if method == 'perfect'
		Video.where(title: content)
		elsif method == 'forward'
		Video.where('title LIKE ?', content+'%')
		elsif method == 'backward'
		Video.where('title LIKE ?', '%'+content)
		else
		Video.where('title LIKE ?', '%'+content+'%')
		end
	elsif model == 'stage'
		if method == 'perfect'
		Stage.where(title: content)
		elsif method == 'forward'
		Stage.where('title LIKE ?', content+'%')
		elsif method == 'backward'
		Stage.where('title LIKE ?', '%'+content)
		else
		Stage.where('title LIKE ?', '%'+content+'%')
	    end
	end
	end
end
