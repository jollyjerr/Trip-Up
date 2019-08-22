class User < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true

    has_secure_password
    has_friendship

    has_and_belongs_to_many :trips
    has_many :posts
    has_many :items

    def friends?
        self.friends
    end

    def friend_requests?
        self.requested_friends.any?
    end

    def requested_friends?
        self.pending_friends.any?
    end

    def invite_friend(user)
        self.friend_request(user)
    end

    def not_friends
        potential = []
        User.all.each do |user|
            if(self.friends_with?(user) != true && self != user && self.friends.include?(user) != true && self.pending_friends.include?(user) != true && self.requested_friends.include?(user) != true)
                potential << user
            end
        end
        potential
    end
    
end