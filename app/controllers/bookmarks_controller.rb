class BookmarksController < ApplicationController
  before_action :set_topic
  before_action :set_bookmark, except: [:create, :new]
  
  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user  #from Devise for secuirty
    
    @bookmark.topic = @topic
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "The bookmark was successfully created."
      redirect_to @topic #could aslo put @bookmark.topic
    else
      flash[:error] = "There was an error saving you bookmark."
      render :new
    end
  end

  def edit
  end

  def update
    authorize @bookmark

    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark successfully edited."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error editing your bookmark."
      render :edit
    end
  end

  def destroy
    @bookmark_url = @bookmark.url
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "#{@bookmark_url} was deleted."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting your bookmark"
      render :show
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

end
