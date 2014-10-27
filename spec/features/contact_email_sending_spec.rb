require "rails_helper"

feature "Contact Email" do
  scenario "Email is sent from contact page" do
    

    # Expect user to be logged in and see their email at the top of the page
    expect(page.html).to have_link(user.email, user_path(user))

    expect(page).to have_content("Sign Out")
    expect(page).to have_content("This is the project one.")
  end
end