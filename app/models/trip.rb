class Trip < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :date, presence: true

    
    belongs_to :category
    belongs_to :location
    has_and_belongs_to_many :users
    has_many :posts
    has_many :items
    
    accepts_nested_attributes_for :location

    def add_user(user)
        self.users.push(user)
    end
 
    def find_friends(user)
        potential = user.friends
        potential.select{|u| self.users.all.exclude?(u)}
    end

    def find_author
        author = User.find_by(id: self.author_id)
        if author
           return author
        else #random failsafe if author deletes profile
            newowner = self.users.sample
            self.owner_id = newowner.id
            self.save
            return newowner
        end
    end

    def self.by_name
        order(:name)
    end

    def self.by_date
        order(:date)
    end

    def self.by_category
        Trip.all.sort_by {|trip| trip.category.name}
    end

    def self.by_most_recent
        t = Trip.by_date
        t.first(5)
    end

    def self.by_location
        Trip.all.sort_by {|trip| trip.location.state}
    end

    def self.by_one_location location
        Trip.all.select{|trip| trip.location.city.downcase.include?(location)}
    end

    def self.by_one_category category
        Trip.all.select{|trip| trip.category.name.downcase.include? category}
    end

    def self.by_specific_name name
        Trip.all.select{|trip| trip.name.downcase.include? name}
    end

    def self.by_specific_user username
        trips = []
        users = User.all.select{|user| user.name.downcase.include?(username)}
        users.each do |user|
            if Trip.all.select{|trip| trip.users.include?(user)} == []
            else
            trips << Trip.all.select{|trip| trip.users.include?(user)}
            end
        end
        trips[0]
    end


    def location_attributes=(location_attributes)
        self.build_location(location_attributes)
    end
end
