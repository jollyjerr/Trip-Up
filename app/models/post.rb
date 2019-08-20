class Post < ApplicationRecord
    belongs_to :user
    belongs_to :trip


    def self.by_date
        order(:created_at)
    end

    def self.by_specific_user user
        Post.select{|p| p.user_id == user.id}
    end

    def self.by_trip trip
        Post.select{|p| p.trip_id == trip.id}
    end
    
end
