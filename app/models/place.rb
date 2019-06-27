class Place < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  has_many :photos

  mount_uploaders :pictures, PictureUploader

  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true, length: {minimum: 3}
  validates :address, presence: true
  validates :description, presence: true
  

end
