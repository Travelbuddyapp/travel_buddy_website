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
      expect(Reservation.count).to eq(0)
      post :create, {user_id: user.id, trip_id: trip.id, reservation: create_params}
      expect(Reservation.count).to eq(1)
      expect(Reservation.last.business_name).to eq(business_name)
    end

    it 'renders the new template on error' do
      create_params = {type: nil}
      post :create, {user_id: user.id, trip_id: trip.id, reservation: create_params}
      expect(response).to render_template('new')
    end
    
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {user_id: user.id, trip_id: trip.id, id: reservation.id}
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #edit" do

    # it "returns http success" do
    #   get :edit, {user_id: user.id, trip_id: trip.id, id: reservation.id}
    #   expect(response).to have_http_status(:success)
    # end

    # it "validates address" do

    # end

    it 'renders the edit template' do
      get :edit, {user_id: user.id, trip_id: trip.id, id: reservation.id}
      expect(response).to have_http_status(:success)
      expect(response).to render_template('edit')
    end
    
  end

  describe "PUT #update" do

    it 'updates a reservation' do
      reservation = Reservation.create(type: 'Other')
      update_params =  {type: 'Other'}
      put :update, {user_id: user.id, trip_id: trip.id, id: reservation.id, reservation: update_params }
      reservation = reservation.reload #need to reload with updated attr to check...
      expect(reservation.type).to eq('Other')
    end

    it 'renders the edit template on error' do
      reservation = Reservation.create(type: 'Other')
      update_params = {type: nil, address: nil}
      put :update, {user_id: user.id, trip_id: trip.id, id: reservation.id, reservation: update_params }
      expect(response).to render_template('edit')
    end

  end

  describe "DELETE #destroy" do
    it "destroys the reservation" do
      reservation = Reservation.create(type: 'Other')
      expect(Reservation.count).to eq(1)
      delete :destroy, {trip_id: trip.id, id: reservation.id}
      expect(Reservation.count).to eq(0)
    end
  end

end
