class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }

  #has_many :posts, dependent: :destroy
  has_one_attached :profile_image

  #def get_profile_image
    #unless profile_image.attached?
      #file_path = Rails.root.join('app/assets/images/profile_sample.png')
      #profile_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    #end
    #profile_image.variant(resize_to_limit: [100, 100]).processed
  #end

end
