class Trip < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    belongs_to :category
    belongs_to :location
    has_and_belongs_to_many :users
    has_many :posts
    has_many :items

    def add_user(user)
        self.users.push(user)
    end

    def find_friends
        User.all.select{|u| self.users.all.exclude?(u)}
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
        Trip.all.sort_by {|trip| trip.location.name}
    end

    def self.by_one_location location
        Trip.all.select{|trip| trip.location.name == location}
    end

    def self.by_one_category category
        Trip.all.select{|trip| trip.category.name == category}
    end

    def self.by_specific_date date
        Trip.all.select{|trip| trip.date == date}
    end

    def self.by_specific_name name
        Trip.all.select{|trip| trip.name == name}
    end

    def self.by_specific_user user
        Trip.all.select do |trip|
            trip.users.select do |user|
                user.name == user
            end
        end
    end

end
