class Emotion < ActiveRecord::Base

  belongs_to :photo
  belongs_to :video

  validates :name, presence: true
  validates :photo_id, presence: true, if: 'video_id.nil?'
  validates :video_id, presence: true, if: 'photo_id.nil?'

  validates :start, :finish, presence: true, if: 'video'

end
