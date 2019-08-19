class Item < ApplicationRecord
    validates :name, presence: true
    belongs_to :trip
    belongs_to :user
end
