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
        categories = Category.by_name
        trips_by_category = []
        categories.each do |c|
            if Trip.find_by(category_id: c.id) != nil
                trips_by_category << Trip.find_by(category_id: c.id)
            end
        end
        trips_by_category
    end

    def self.by_most_recent
        t = Trip.by_date
        t.first(5)
    end

    def self.by_location
        locations = Location.by_name
        trips_by_location = []
        locations.each do |l|
            if Trip.find_by(location_id: l.id) != nil
                trips_by_location << Trip.find_by(location_id: l.id)
            end
        end
        trips_by_location
    end

    def self.one_location location
        Trip.find_all(location_id: location.id)
    end

    def self.one_category category
        Trip.find_all(category_id: category.id)
    end

    def self.by_specific_date date
        Trip.find_all(date: date)
    end

    def self.by_specific_name name
        Trip.find_by(name: name)
    end

    def self.by_specific_user user
        Trip.select do |t|
            t.users.find_by(id: user.id)
        end
    end

end
