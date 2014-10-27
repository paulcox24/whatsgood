require "rails_helper"

feature "Contact Email" do
  scenario "not sent when fields are not complete" do
    visit static_pages_contact_path
    fill_in "email_name", :with => "Test Name"
    click_button "Send"
    expect(page).to have_content ("All Fields Must Be Complete")
  end
  scenario "sent when fields are complete" do
    visit static_pages_contact_path
    fill_in "email_name", :with => "Test Name"
    fill_in "email_email", :with => "email@email.com"
    fill_in "email_subject", :with => "Test Subject"
    fill_in "email_message", :with => "Test Message"
    click_button "Send"
    expect(page).to have_content ("Message Sent")
  end
end