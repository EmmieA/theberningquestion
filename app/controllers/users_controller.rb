class UsersController < ApplicationController
  
  before_action :get_user, only: [:destroy, :show]
  
  def index
    @users = User.all.order('created_at DESC')
  end
  
  def destroy
    @user.destroy
    flash[:danger] = "User successfully removed"
    redirect_to users_path
  end
  
  def show
  end

  def my_friends
    @friendships = current_user.friends
  end
  
  def user_questions()
    if params[:user_id]
      @questions = User.user_questions(params[:user_id])
    end
  end
  
  def search
    @users = User.search(params[:search_param])
    
    if @users
      @users = current_user.except_current_user(@users)
      render partial: 'friends/lookup'
    else
      render status: :not_found, nothing: true
    end
    
  end
  
  def my_feed
    @friend_posts = current_user.friend_posts
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    
    if current_user.save
      # redirect_to my_friends_path, notice: "Friend successfully added"
      redirect_to my_friends_path
    else
      redirect_to my_friends_path, flash[:error] = "There was a problem creating the friend"
    end
  end
  
  private
  
    def get_user
      @user = User.find(params[:id])
    end
  
end
