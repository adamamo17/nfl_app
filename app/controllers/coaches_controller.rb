class CoachesController < ApplicationController

  def show
    @coach = Coach.find(params[:id])
  end

  def new
  end
end