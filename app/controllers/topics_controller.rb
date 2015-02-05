class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))
    if @topic.save
      flash[:notice] = "Topic was successfully created..."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving your topic..."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params.require(:topic).permit(:title))
      flash[:notice] = "Topic was successfully updated..."
      redirect_to @topic
    else
      flash[:error] = "There was an error updating your topic..."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    title = @topic.title

    if @topic.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully..."
      redirect_to topics_path
    else
      flash[:error] = "Ther was an error deleting the topic"
      render :show
    end
  end

end
