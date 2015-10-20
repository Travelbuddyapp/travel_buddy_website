require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
let(:user){FactoryGirl.create(:user)}
let(:trip){FactoryGirl.create(:trip, user_id: user.id)}
let(:checklist){FactoryGirl.create(:checklist, trip_id: trip.id)}
let(:reservation){FactoryGirl.create(:reservation, trip_id: trip.id)}
before(:each) do
  sign_in user
end

  describe "GET #home" do

    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get :home, {user_id: user.id, id: trip.id}
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
