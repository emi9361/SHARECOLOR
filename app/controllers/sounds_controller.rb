class SoundsController < ApplicationController
  def index
  	@sounds = Sound.all

  end

  def show
  	@sound = Sound.find(params[:id])
  end

  def edit
  	@sound = Sound.find(params[:id])
  end

  def new
  	@sound = Sound.new
  end

  def create
  	sound = Sound.new(sound_params)
  	user = current_user
  	sound.user_id = user.id
  	sound.save
  	redirect_to '#',notice:'Upできたお〜'
  end

end
