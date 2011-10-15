require 'spec_helper'

describe RelationshipsController do
    
    describe "POST 'create'" do
        before(:each) do
            @user = Factory :user
            @followed = Factory(:user, :name => Factory.next(:name))
        end
        
       it "should create a relationship" do
           lambda do
               post :create, :relationship => { :followed_id => @followed, :follower_id => @user }
               response.should be_redirect
           end.should change(Relationship, :count).by(1)
       end
        
    end
    
    describe "DELETE 'destroy'" do
        before(:each) do
            @user = Factory(:user)
            @followed = Factory(:user, :name => Factory.next(:name))
            @user.follow!(@followed)
            @relationship = @user.relationships.find_by_followed_id(@followed)
        end

        it "should destroy a relationship" do
            lambda do
                delete :destroy, :id => @relationship
                response.should be_redirect
            end.should change(Relationship, :count).by(-1)
        end
    end
    
end