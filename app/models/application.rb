class Application < ActiveRecord::Base

  validates :name, presence: true
  has_many :testers

end
