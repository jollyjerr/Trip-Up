require 'rails_helper'

describe 'Users#show' do

    before(:each) do
        user = User.create(id: 1, name: "Bob", email: "bobbyboy@gmail.com", password: "test", password_confirmation: "test")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_path(user)
    end

    it 'has valid route' do

        expect(page.status_code).to eq(200)
    end

    it 'displays the users name' do
        expect(page).to have_content("Bob")
    end

end