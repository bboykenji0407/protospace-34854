class Prototype < ApplicationRecord
  #has_many :prototype_users
  #has_many :users, through: prototype_users
  has_many :comments, foreign_key: "prototype_id", dependent: :destroy
  belongs_to :user
  has_one_attached :image

  validates :catch_copy, presence: true
  validates :concept,  presence: true
  validates :title, presence: true
  validates :image, presence: true
end
