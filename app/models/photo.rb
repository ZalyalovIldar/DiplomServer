class Photo < ActiveRecord::Base


  has_many :emotions, dependent: :destroy
  belongs_to :imageable, polymorphic: true

  validates :image, :imageable_id, :imageable_type, presence: true

  accepts_nested_attributes_for :emotions, allow_destroy: true

  def emojis
    data = emotions.map(&:name)
    result = data.map do |e|
      image = Emoji.image_url_for_unicode_moji(e)
      asset_path = ActionController::Base.helpers.asset_path(image)
      ActionController::Base.helpers.image_tag(asset_path)
    end.join(' ')
    result.tr!('"', "'")
    result
  end

end

