# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Location.destroy_all


Category.create(:name => "Biking")
Category.create(:name => "Hiking")
Category.create(:name => "Camping")
Category.create(:name => "Climbing")
Category.create(:name => "Fishing")
Category.create(:name => "Hunting")
Category.create(:name => "Backpacking")
Category.create(:name => "Other")

Location.create(:city => "Denver", :state => "CO")
Location.create(:city => "Boulder", :state => "CO")
Location.create(:city => "New York City", :state => "NY")
Location.create(:city => "Easton", :state => "PA")
Location.create(:city => "Carlsbad", :state => "CA")
Location.create(:city => "Portland", :state => "OR")
Location.create(:city => "Seattle", :state => "WA")
Location.create(:city => "Tampa", :state => "FL")