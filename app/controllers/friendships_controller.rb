class FriendshipsController < ApplicationController

  def destroy
    # A friend object is being passed in the params hash and apparently you 
    # can just make the assumption that referring to :id will retrieve that friend's
    # id. What if there were other objects with IDs in the hash as well??
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    respond_to do |format|
      # format.html { redirect_to my_friends_path, notice: "Friend successfully removed"}
      format.html { redirect_to my_friends_path }
    end
  end
  
end
