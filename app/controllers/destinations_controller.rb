class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
    @destinations.uniq
  end

  def show
    @destination = Destination.find(params[:id])
    @most_liked = @destination.most_liked_post
    @most_recent = @destination.most_recent_posts
    @ave_age = @destination.bloggers_age
  end

end
