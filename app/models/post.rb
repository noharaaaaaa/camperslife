class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy

  def gooded_by?(user)
    goods.exists?(user_id: user.id)
  end

  with_options presence: true do
    validates :title
    validates :article
    validates :place
    validates :user_id
  end

  geocoded_by :address
  after_validation :geocode

end
