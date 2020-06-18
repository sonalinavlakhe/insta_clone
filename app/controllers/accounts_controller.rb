class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]

  
  def index
    #user dashboard -post feed
    @posts = Post.active
    @comment = Comment.new
    following_ids = AccountFollower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids)
  end

  def follow_account
    follower_id = params[:follow_id]
    if AccountFollower.create!(follower_id: current_account.id, following_id: follower_id)
      flash[:success] = "Now following user"
    else
      flash[:danger] = "Unable to add followers"
    end
    redirect_to dashboard_path
  end

  def profile
    @posts = @account.posts.active
  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
