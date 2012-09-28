class CoachesController < ApplicationController

  def show
    @coach = Coach.find(params[:name])
  end

  def new
  end
end