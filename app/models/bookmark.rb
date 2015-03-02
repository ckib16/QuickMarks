class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  has_many :likes, dependent: :destroy

  after_create :populate_embedly_image


  def populate_embedly_image
    # this is where you'd make the call to embedly
    # once you get the image url, 
    # save the image url as part of the bookmark
  end
end
