require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
let(:user){FactoryGirl.create(:user)}
let(:trip){FactoryGirl.create(:trip, user_id: user.id)}
let(:reservation){FactoryGirl.create(:reservation, trip_id: trip.id)}
before(:each) do
  sign_in user
end

  describe "GET #index" do
    it "returns http success" do
      get :index, {user_id: user.id, trip_id: trip.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, {user_id: user.id, trip_id: trip.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    it 'creates a new reservation' do
      business_name = 'Place of Reservation 1'
      create_params = {type: 'Travel', business_name: 'Place of Reservation 1', confirmation_number: 'Confirmation number 1'}
      # binding.pry
      expect(Reservation.count).to eq(0)
      post :create, { user_id: user.id, trip_id: trip.id, reservation: create_params}
      expect(Reservation.count).to eq(1)
      expect(Reservation.last.business_name).to eq(business_name)
    end

    it 'renders the new template on error' do
      create_params = {user_id: user.id, reservation: {type: nil}}
      post :create, create_params
      expect(response).to render_template('new')
    end
    
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
