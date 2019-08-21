require 'rails_helper'

describe 'User' do
    before(:each) do 
        @user = User.create(id: 1, name: "Bob", email: "bobbyboy@gmail.com", password: "test", password_confirmation: "test")
    end

    it 'Has a valid name and email' do
        expect(@user.name).to eq("Bob")
        expect(@user.email).to eq("bobbyboy@gmail.com")
    end

end