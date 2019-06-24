class PicturesController < ApplicationController
  before_action :authenticate_user!

  def create
      @place = Place.find(params[:place_id])
      @place.pictures.create(comment_params.merge(user: current_user))
      redirect_to place_path(@place)
  end

  private

  def comment_params
    params.require(:picture).permit(:file)
  end
end
