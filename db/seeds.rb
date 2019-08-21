# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(:name => "Biking")
Category.create(:name => "Hiking")
Category.create(:name => "Camping")
Category.create(:name => "Climbing")
Category.create(:name => "Fishing")
Category.create(:name => "Hunting")
Category.create(:name => "Backpacking")
Category.create(:name => "Other")

cities = ["New York,NY", "Los Angeles,CA", "Chicago,IL", "Houston,TX", "Phoenix,AZ", "Philadelphia,PA", "San Antonio,TX", "San Diego,CA", "Dallas,TX", "San Jose,CA", "Austin,TX", "Jacksonville,FL", "Fort Worth,TX", "Columbus,OH", "San Francisco,CA", "Charlotte,NC", "Indianapolis,IN", "Seattle,WA", "Denver,CO", "Boston,MA", "Detroit,MI", "Nashville,TN", "Portland,OR", "Memphis,TN"]

cities.each do |city|
    c = city.split(',')
    Location.create(:city => c[0], :state => c[1])
end