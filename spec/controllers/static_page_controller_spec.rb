require 'rails_helper'

RSpec.describe StaticPageController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about_us" do
    it "returns http success" do
      get :about_us
      expect(response).to have_http_status(:success)
    end
  end

end
