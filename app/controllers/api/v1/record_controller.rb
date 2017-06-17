require 'dropbox_sdk'

class Api::V1::RecordController < ApplicationController


  # {
  #     user_name: "",
  #     app_name: "",
  #     app_desc: "",
  #     user_desc: "",
  #     data: {
  #         images: [
  #             {
  #                 data: "",
  #                 emotions: []
  #             }
  #         ],
  #         video: [
  #             {
  #                data: "",
  #                emotions: [
  #                    {
  #                        name: ' ',
  #                        start: ' ',
  #                        finish: ' '
  #                    }
  #                ],
  #                duration: ' '
  #             }
  #         ]
  #     }
  # }

  skip_before_action :check_auth

  def create

    record = params[:record]

    app = Application.find_or_create_by(name: record[:app_name], description: record[:app_desc])
    user = Tester.find_or_create_by( application: app, name: record[:user_name], descriptions: record[:user_desc] )


    destroy_all_data(app,user)
    images = params[:data][:images]
    videos = params[:data][:videos]
    images && images.each do |image_data|
      photo = Photo.new
      emotions = image_data[:emotions]
      photo.image = image_data[:data]
      photo.imageable = user
      # photo.application = app
      photo.save

      emotions && emotions.each do |e|
        Emotion.create(name: e,photo: photo)
      end
    end
    videos && videos.each do |video_data|
      video = Video.new
      emotions = video_data[:emotions]
      video.data = video_data[:data]
      video.duration = video_data[:duration]
      video.application = app
      video.tester = user
      video.save
      emotions && emotions.each do |e|
        name = e[:name]
        start = e[:start]
        finish = e[:finish]
        Emotion.create(name: name,video: video,start: start, finish: finish)
      end

    end

    render json: {
        result: app.to_json
    }
  end

  def upload_video
    app = Application.find_by(id: params[:id])
    tester = Tester.find_by(name: params[:user_name])
    params[:videos].each do |video_data|

    end
    render json: {
        result: 'success'
    }
  end

  private

  def destroy_all_data app,user
    Photo.where(imageable: user).destroy_all
    Video.where(tester: user).destroy_all
  end

end


