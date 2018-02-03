class StaticPagesController < ApplicationController
  def home
  end

  def privacy
  end

  def terms
  end

  def location
    if params[:view] == "map" 
      render :map
    end
  end

end
