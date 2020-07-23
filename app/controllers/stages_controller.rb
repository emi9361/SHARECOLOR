class StagesController < ApplicationController
  def index
  	@stage = Stage.all
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
end
