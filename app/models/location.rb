class Location < ApplicationRecord
    validates :name, presence: true
    has_many :trips

    def self.by_name
        order(:name)
    end

end
