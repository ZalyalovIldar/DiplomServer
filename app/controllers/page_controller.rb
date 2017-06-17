class PageController < ApplicationController


  def index
    @applications = Application.all
  end

  def app_show
    @app = Application.find_by(id: params[:id])
  end

  def tester_show
    @tester = Tester.find_by(id: params[:id])
    @photos = @tester.photos
    @videos = @tester.videos
  end


end
