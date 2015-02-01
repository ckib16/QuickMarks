class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    #Look at these in the server log to get a sense of what is goig on
    puts "INCOMING PARAMS HERE: #{params}"

    #Add message splitting logic here
    
    # Find the user by using params[:sender]
    # Find the topic by using params[:subject]
    # Assign the url to a variable after retreiving it from params["body-plain"]

    # Check if user is nil, if so, create and save a new user
    @user = User.find_or_create_by(params[:sender])

    # Check if the topic is nil, if so, create and save a new topic
    @topic = Topic.find_or_create_by(params[:subject])

    # Now that we're sure we have a valid user and topic, build and save a new bookmark
    @url = params["body-plain"]
    @topic.bookmarks.create(url: @url)

    head 200
  end
end