class UsersController < ApplicationController
  def show
    @name = current_user.name
    @user_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.liked_bookmarks
  end
end
