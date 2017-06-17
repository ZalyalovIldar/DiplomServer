class Video < ActiveRecord::Base

  belongs_to :tester
  belongs_to :application

  has_many :emotions, dependent: :destroy

  validates :data, :application_id, :tester_id, presence: true

  accepts_nested_attributes_for :emotions, allow_destroy: true

  def emojis
    emoji_index = Emoji::Index.new
    timeline = emotions.map do |e|
      name = emoji_index.find_by_moji(e.name)['name']
      [name, e.start, e.finish]
    end
    pie = timeline.reduce({}) do |e,k|
      e[k[0]] ||= 0
      e[k[0]] += 1
      e
    end
    [timeline,pie]
  end

end
