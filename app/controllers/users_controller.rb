class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.liked_bookmarks
  end
end
