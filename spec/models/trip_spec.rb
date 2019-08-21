require 'rails_helper'

describe 'Trip' do
    before(:each) do 
        @trip_1 = Trip.create(name: "Walleye City", description: "Lunkers for days")
    end

    it 'Has a valid name and description' do
        expect(@trip_1.name).to eq("Walleye City")
        expect(@trip_1.description).to eq("Lunkers for days")
    end
end