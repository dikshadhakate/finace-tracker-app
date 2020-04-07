class UsersController < ApplicationController

  def my_portfolio
  	@user = current_user
  	@tracked_stocks = current_user.stocks
  end

  def friends
  	@friends = current_user.friends
  end
  
  def search_friend
		if params[:friend].present?
			@friends = User.search(params[:friend])
			@friends = current_user.except_current_user(@friends) #this method we are using bcoz we don't want to show the current user in search
			if @friends
				respond_to do |format|
					format.js { render partial: 'users/friend_result'}
				end	
			else
				respond_to do |format|
					flash.now[:alert] = "Couldn't find user."
					format.js { render partial: 'users/friend_result'}
				end	
			end	
		else
			respond_to do |format|
					flash[:alert] = "Please enter a user email or name to search."
					format.js { render partial: 'users/friend_result'}
			end
		end	
	end

	def show
		@user = User.find(params[:id])
		@tracked_stocks = @user.stocks
	end
end
