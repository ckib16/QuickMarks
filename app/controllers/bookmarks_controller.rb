class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:url))
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "The bookmark was successfully created."
      redirect_to @bookmark
    else
      flash[:error] = "There was an error saving you bookmark."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      flash[:notice] = "Bookmark successfully edited."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error editing your bookmark."
      render :edit
    end

  end

end
