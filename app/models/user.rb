class User < ActiveRecord::Base
    has_many :relationships, :foreign_key => "follower_id",
                             :dependent => :destroy
    has_many :following, :through => :relationships, :source => :followed
    
    has_many :reverse_relationships, :foreign_key => "followed_id",
                                     :class_name => "Relationship",
                                     :dependent => :destroy
    has_many :followers, :through => :reverse_relationships, :source => :follower
    
    
    def self.unfollowed_by(user)
        User.all - user.following
    end
    
    def following?(followed)
        relationships.find_by_followed_id(followed)
    end
    
    def follow!(followed)
        relationships.create!(:followed_id => followed.id)
    end
    
    def unfollow!(followed)
        relationships.find_by_followed_id(followed).destroy
    end
    
end
