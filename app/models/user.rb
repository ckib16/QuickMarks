class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :topics, dependent: :destroy
  has_many :bookmarks, through: :topics, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked(post)
    likes.where(bookmark_id: bookmark_id).first
  end

end

