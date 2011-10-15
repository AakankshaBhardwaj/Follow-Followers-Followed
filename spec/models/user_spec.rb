require 'spec_helper'

describe User do
    
    describe "relationships" do
        before(:each) do
            @user = User.create!(:name => 'Test User')
            @followed = Factory(:user)
        end
        
        it "should have a relationship method" do
           @user.should respond_to(:relationships)
        end
        
        it "should have a follwing method" do |variable|
            @user.should respond_to(:following)
        end
        
        it "should have a following? method" do
            @user.should respond_to(:following?)
        end

        it "should have a follow! method" do
            @user.should respond_to(:follow!)
        end

        it "should follow another user" do
            @user.follow!(@followed)
            @user.should be_following(@followed)
        end

        it "should include the following user in the following array" do
            @user.follow!(@followed)
            @user.following.should include(@followed)
        end
        
        it "should respond to a method unfollow!" do
            @user.should respond_to :unfollow!
        end
        
        it "should unfollow a user" do
            @user.follow!(@followed)
            @user.unfollow!(@followed)
            @user.following.should_not include @followed
        end
        
        #
        it "should have a reverse_relationships method" do
            @user.should respond_to :reverse_relationships
        end
        
        it "should have a followers method" do
            @user.should respond_to :followers
        end
        
        it "should include the follower in the followers array" do
            @user.follow!(@followed)
            @followed.followers.should include @user
        end
        
        describe "unfollowed by @user lists access" do
            before(:each) do
                @user = Factory(:user)
                @followed_1 = Factory(:user, :name => Factory.next(:name))
                @user.follow! @followed_1
                @followed_2 = Factory(:user, :name => Factory.next(:name))
                @user.follow! @followed_2
            end



            it "should get back list of all unfollowed by @user" do
                User.unfollowed_by(@user).should_not include @user.following
            end

        end
        
    end
   
   
end
