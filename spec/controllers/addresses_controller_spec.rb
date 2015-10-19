require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
let(:user){FactoryGirl.create(:user)}
let(:trip){FactoryGirl.create(:trip, user_id: user.id)}
let(:reservation){FactoryGirl.create(:reservation, trip_id: trip.id)}
let(:address){FactoryGirl.create(:address, reservation_id: reservation.id)}
before(:each) do
  sign_in user
end

  describe "GET #new" do
    it "returns http success" do
      get :new, {trip_id: trip.id, reservation_id: reservation.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    it 'creates a new address' do
      street_address = 'Address 1'
      create_params = {address: 'Address 1'}
      expect(Address.count).to eq(0)
      post :create, {trip_id: trip.id, reservation_id: reservation.id, address: create_params}
      expect(Address.count).to eq(1)
      expect(Address.last.address).to eq(street_address)
    end

    it 'renders the new template on error' do
      create_params = {address: nil}
      post :create, {trip_id: trip.id, reservation_id: reservation.id, address: create_params}
      expect(response).to render_template('new')
    end
    
  end

  describe "GET #edit" do

    it "returns http success" do
      get :edit, {trip_id: trip.id, reservation_id: reservation.id, id: address.id}
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      get :edit, {trip_id: trip.id, reservation_id: reservation.id, id: address.id}
      expect(response).to render_template('edit')
    end
    
  end

  describe "PUT #update" do

    it 'updates a address' do
      address = Address.create(address: 'Address 1')
      update_params =  {address: 'Address 1'}
      put :update, {trip_id: trip.id, reservation_id: reservation.id, id: address.id, address: update_params}
      address = address.reload #need to reload with updated attr to check...
      expect(address.address).to eq('Address 1')
    end

    it 'renders the edit template on error' do
      address = Address.create(address: 'Address 1')
      update_params = {address: nil}
      put :update, {trip_id: trip.id, reservation_id: reservation.id, id: address.id, address: update_params }
      expect(response).to render_template('edit')
    end

  end

  describe "DELETE #destroy" do
    it "destroys the address" do
      address = Address.create(address: 'Address 1')
      expect(Address.count).to eq(1)
      delete :destroy, {trip_id: trip.id, reservation_id: reservation.id, id: address.id}
      expect(Address.count).to eq(0)
    end
  end

  # ********** Above is for reservation address testing.
  # ********** Do we need below for user address testing?
  # ********** or do we need a special model/controller?

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new, {user_id: user.id}
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "POST #create" do

  #   it 'creates a new address' do
  #     street_address = 'Address 1'
  #     create_params = {address: 'Address 1'}
  #     expect(Address.count).to eq(0)
  #     post :create, {user_id: user.id, address: create_params}
  #     expect(Address.count).to eq(1)
  #     expect(Address.last.address).to eq(street_address)
  #   end

  #   it 'renders the new template on error' do
  #     create_params = {address: nil}
  #     post :create, {user_id: user.id, address: create_params}
  #     expect(response).to render_template('new')
  #   end
    
  # end

  # describe "GET #edit" do

  #   it "returns http success" do
  #     get :edit, {user_id: user.id, id: address.id}
  #     expect(response).to have_http_status(:success)
  #   end

  #   it 'renders the edit template' do
  #     get :edit, {user_id: user.id, id: address.id}
  #     expect(response).to render_template('edit')
  #   end
    
  # end

  # describe "PUT #update" do

  #   it 'updates a address' do
  #     address = Address.create(address: 'Address 1')
  #     update_params =  {address: 'Address 1'}
  #     put :update, {user_id: user.id, id: address.id, address: update_params} #?
  #     address = address.reload #need to reload with updated attr to check...
  #     expect(address.address).to eq('Address 1')
  #   end

  #   it 'renders the edit template on error' do
  #     address = Address.create(address: 'Address 1')
  #     update_params = {address: nil}
  #     put :update, {user_id: user.id, address: update_params } # This or line 129?
  #     expect(response).to render_template('edit')
  #   end

  # end

  # describe "DELETE #destroy" do
  #   it "destroys the address" do
  #     address = Address.create(address: 'Address 1')
  #     expect(Address.count).to eq(1)
  #     delete :destroy, {id: address.id} #does address need to be nested under user?
  #     expect(Address.count).to eq(0)
  #   end
  # end

end
