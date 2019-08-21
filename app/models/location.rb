class Location < ApplicationRecord
    validates :city, presence: true
    validates :state, presence: true
    has_many :trips
    geocoded_by :address
    after_validation :geocode

    def self.by_city
        order(:city)
    end

    def address
        [city, state].compact.join(', ')
    end

end
