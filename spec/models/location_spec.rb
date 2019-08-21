require 'rails_helper'

describe 'Location' do
    before(:each) do 
        @location_1 = Location.create(city: "Denver", state: "CO")
        @location_2 = Location.create(city: "Carlsbad", state: "CA")
        @location_3 = Location.create(city: "Jersey City", state: "NJ")
    end

    it 'Has a valid city and state' do
        expect(@location_1.city).to eq("Denver")
        expect(@location_1.state).to eq("CO")
        expect(@location_2.city).to eq("Carlsbad")
        expect(@location_2.state).to eq("CA")
        expect(@location_3.city).to eq("Jersey City")
        expect(@location_3.state).to eq("NJ")
    end

    it 'Creates longitude and latitude based on city and state' do
        expect(@location_1.longitude).to eq(-104.9848623)
        expect(@location_1.latitude).to eq(39.7392364)
        expect(@location_2.longitude).to eq(-117.3505966)
        expect(@location_2.latitude).to eq(33.1580933)
        expect(@location_3.longitude).to eq(-74.0776417)
        expect(@location_3.latitude).to eq(40.7281575)
    end
end