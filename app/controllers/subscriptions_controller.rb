class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_community, only: [:create, :destroy]

  # Creates a new subscription for the current user to the community
  def create
    @subscription = @community.subscriptions.new(user: current_user)

    respond_to do |format|
      if @subscription.save
        format.turbo_stream
        format.html { redirect_to community_path(@community), notice: "You successfully subscribed." }
      else
        format.html { redirect_to community_path(@community), alert: "Your subscription could not be saved." }
      end
    end
  end

  # Destroys the user's subscription to the community
  def destroy
    @subscription = @community.subscriptions.find_by(user: current_user)

    if @subscription
      @subscription.destroy
      respond_to do |format|
        format.html { redirect_back fallback_location: community_path(@community), notice: "You successfully unsubscribed." }
      end
    else
      respond_to do |format|
        format.html { redirect_back fallback_location: community_path(@community), alert: "You are not subscribed to this community." }
      end
    end
  end

  private

  # Sets the community based on the community_id passed in params
  def set_community
    @community = Community.find(params[:community_id])
  end
end
