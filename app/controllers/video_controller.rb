class VideoController < ApplicationController

  def index
  end

  def show
    video = Video.find_by(id: params[:id])

    data = if video.nil? || video.data.nil?
             send_data( File.read( 'public/404.png'), type: 'image/png', disposition: 'inline' )
           else
             send_data( Base64::decode64(video.data), type: 'video/mp4', disposition: 'inline' )
           end


  end
  def create

  end

  def destroy

  end

  def update

  end

end
