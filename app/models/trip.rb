class Trip < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    belongs_to :category
    belongs_to :location
    has_many :users, through: :users_trips
    has_many :posts
    has_many :items

end
