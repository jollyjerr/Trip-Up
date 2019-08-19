class Trip < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    belongs_to :category
    belongs_to :location
    has_and_belongs_to_many :users
    has_many :posts
    has_many :items

end
