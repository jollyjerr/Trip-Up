require 'rails_helper'
# before(:each) do
#     Trip.create(name: "Walleye City", description: "Lunkers for days")
# end

describe 'Trips#show' do

    before(:each) do
        location = Location.create(city: "Denver", state: "NY")
        category = Category.create(name: "Hiking")
        @trip = Trip.create!(id: 1, name: "Backpackin'", description: "Wooohooo", category_id: 1, location_id: 1, date: "2019-08-24 12:30:00")
        user = User.create(id: 1, name: "Bob", email: "bobbyboy@gmail.com", password: "test", password_confirmation: "test")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit trip_path(@trip)
    end

    it 'has valid route' do

        expect(page.status_code).to eq(200)
    end

    it 'has a title and description' do
        expect(page).to have_content("Backpackin'")
        expect(page).to have_content("Wooohooo")
    end

end