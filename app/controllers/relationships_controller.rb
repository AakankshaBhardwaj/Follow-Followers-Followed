class RelationshipsController < ApplicationController
    
    def create
        @user = User.find(params[:relationship][:follower_id])
        @new_followed = User.find(params[:relationship][:followed_id])
        @user.follow! @new_followed
        redirect_to @user
    end
    
    def destroy
        @relationship = Relationship.find(params[:id])
        @current_user = @relationship.follower
        @user_to_unfollow = @relationship.followed
        @current_user.unfollow!(@user_to_unfollow)
        redirect_to @current_user
    end
    
end