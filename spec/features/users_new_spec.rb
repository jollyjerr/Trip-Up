require 'rails_helper'

describe 'Users#new' do

    before(:each) do
        visit new_user_path
    end

    it 'has valid route' do

        expect(page.status_code).to eq(200)
    end

    it 'renders a form' do
        expect(page).to have_content("Username")
        expect(page).to have_content("Email")
        expect(page).to have_content("Password")
        expect(page).to have_content("Retype Password")
    end

    it 'submits form content and creates a record of user' do
        fill_in 'user_name', with: "Sammy"
        fill_in 'user_email', with: "Sammy@samskill.com"
        fill_in 'user_password', with: "test"
        fill_in 'user_password_confirmation', with: "test"

        click_on "commit"

        expect(User.last).to be_valid
    end
    
end