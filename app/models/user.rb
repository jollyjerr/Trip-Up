class User < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true

    has_secure_password
    has_and_belongs_to_many :trips
    has_many :posts
    has_many :items
end