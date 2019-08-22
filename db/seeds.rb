# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
State.destroy_all

Category.create(:name => "Biking")
Category.create(:name => "Hiking")
Category.create(:name => "Camping")
Category.create(:name => "Climbing")
Category.create(:name => "Fishing")
Category.create(:name => "Hunting")
Category.create(:name => "Backpacking")
Category.create(:name => "Other")

states = ["AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]

states.each do |state|
    State.create(:name => state)
end