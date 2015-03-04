class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like
    if like.save
      flash[:notice] = "Successfully liked..."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:danger] = "There was an error liking this bookmark"
      redirect_to [@bookmark.topic, @bookmark]
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    authorize like
    if like.destroy
      flash[:notice] = "Successfully unliked..."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:warning] = "There was an error un-liking this bookmark"
      redirect_to [@bookmark.topic, @bookmark]
    end
  end
end
