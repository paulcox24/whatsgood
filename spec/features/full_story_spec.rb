require "rails_helper"

feature "Full Story" do

  scenario "login, favorite a card" do
    visit new_user_registration_path
    page.all(:fillable_field, 'user_email')[1].set('test@email.com')
    fill_in "user_first_name", :with => "Test"
    fill_in "user_last_name", :with => "Name"
    page.all(:fillable_field, 'user_password')[1].set('password')
    fill_in "user_password_confirmation", :with => "password"
    click_button "Submit"
    click_link "Update Interests"
    click_button "Update"
    expect(page).to have_content ("Current password can't be blank")
    visit static_pages_today_path
    visit static_pages_this_week_path
    visit categories_path
    click_link "test@email.com"
    uri = URI.parse(current_url)
    uri = uri.to_s[0..-8] + "events/new"
    visit uri
    click_button "Create Event"
    click_link "Unfavorite"
    visit root_path
    click_button "Update location"
    visit stats_path
    click_link "test@email.com"
    uri = URI.parse(current_url)
    uri = uri.to_s[0..-8] + "events"
    visit uri
    click_link "New Event"
    click_button "Create Event"
    visit uri
    click_link "Edit"
    click_button "Update Event"
    click_link "test@email.com"
    user_1_uri = URI.parse(current_url)
    click_link "Sign Out"
    visit new_user_registration_path
    page.all(:fillable_field, 'user_email')[1].set('test2@email.com')
    fill_in "user_first_name", :with => "Test2"
    fill_in "user_last_name", :with => "Name2"
    page.all(:fillable_field, 'user_password')[1].set('password')
    fill_in "user_password_confirmation", :with => "password"
    click_button "Submit"
    visit user_1_uri.to_s
    click_link "Follow"
    click_link "Unfollow"
    save_and_open_page
  end
end