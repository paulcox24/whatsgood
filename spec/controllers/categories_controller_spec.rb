require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do

  describe "GET update_eventful_categories" do
    it "returns http success" do
      get :update_eventful_categories
      expect(response).to have_http_status(:success)
    end
  end

end
