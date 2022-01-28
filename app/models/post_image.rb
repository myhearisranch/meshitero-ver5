class PostImage < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :shop_name, presence: true
  validates :image, presence: true

  #引数のidがfavoritesモデルのuser_idに存在するかどうか

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end



  def get_image
    unless image.attached?

      #no_image.jpgが何処にあるか指す
      file_path = Rails.root.join('app/assets/images/no_image.jpg')

      #io: どのファイルを取得するのか
      #image.attach : imageに画像をくっつける
      #image/jpg: jpgの画像をつける
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: "image/jpg")
    end

    #image = return self.image
    #self: .がついている前のものを指す
    image
  end

  # def get_image
  #   if image.attached?
  #     image
  #   else
  #     'no_image.jpg'
  #   end
  # end

end
