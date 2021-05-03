class RelationshipsController < ApplicationController

  def create
    follower = current_user.active_relationships.new(follower_id: params[:user_id])
    follower.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = User.find(params[:user_id])
    follower = current_user.active_relationships.find_by(followed_id: current_user.id,follower_id: user.id)
    follower.destroy
    redirect_back(fallback_location: root_path)
  end


end
