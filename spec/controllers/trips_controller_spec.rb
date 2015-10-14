require 'rails_helper'

RSpec.describe TripsController, type: :controller do
let(:user){FactoryGirl.create(:user)}
let(:trip){FactoryGirl.create(:trip)}
before(:each) do
  sign_in user
  user.trips << trip
end

  describe "GET #index" do
    it "returns http success" do
      get :index, {user_id: user.id, id: trip.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, {user_id: user.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    it 'creates a new trip' do
      name = "Trip 1"
      create_params = {user_id: user.id, trip: {name: 'Trip 1', description: 'Description 1'} }
      expect(Trip.count).to eq(1)
      post :create, create_params
      expect(Trip.count).to eq(2)
      expect(Trip.last.name).to eq(name)
    end

    it 'renders the new template on error' do
      create_params = {user_id: user.id, trip: {name: nil}}
      post :create, create_params
      expect(response).to render_template('new')
    end
    
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {user_id: user.id, id: trip.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do

    it "returns http success" do
      get :edit, {user_id: user.id, id: trip.id}
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      get :edit, {user_id: user.id, id: trip.id}
      expect(response).to render_template('edit')
    end
    
  end

  describe "PUT #update" do

    it 'updates a trip' do
      trip = Trip.create(name: 'Trip 1')
      update_params = {id: trip.id, user_id: user.id, trip: {name: 'Trip 1'}}
      put :update, update_params
      trip = trip.reload #need to reload with updated attr to check...
      expect(trip.name).to eq('Trip 1')
    end

    it 'renders the edit template on error' do
      trip = Trip.create(name: "Trip 1")
      update_params = {id: trip.id, user_id: user.id, trip: {name: nil}}
      put :update, update_params
      expect(response).to render_template('edit')
    end

  end

  describe "DELETE #destroy" do
    it "destroys the trip" do
      expect(Trip.count).to eq(1)
      delete :destroy, {id: trip.id, user_id: user.id}
      expect(Trip.count).to eq(0)
    end
  end

end
