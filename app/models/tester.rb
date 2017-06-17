class Tester < ActiveRecord::Base

  belongs_to :application
  has_many :photos, as: :imageable, dependent: :destroy
  has_many :videos

  validates :name, :application_id, presence: true


end
