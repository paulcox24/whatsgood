require "rails_helper"

feature "Login with FB" do
  scenario "not sent when fields are not complete" do
    visit "/auth/facebook"
   
  end
  
end