require 'rails_helper'

RSpec.describe VaccinesController, type: :controller do
  let(:user){FactoryGirl.create(:user)}
  let(:vaccine){FactoryGirl.create(:vaccine, user_id: user.id)}
  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, {user_id: user.id, id: vaccine.id}
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

    it 'creates a new vaccine' do
      vac_name = 'Vaccine 1'
      create_params = {name: 'Vaccine 1', details: 'Details 1'}
      expect(Vaccine.count).to eq(0)
      post :create, { user_id: user.id, vaccine: create_params }
      expect(Vaccine.count).to eq(1)
      expect(Vaccine.first.name).to eq(vac_name)
    end

    it 'renders the new template on error' do
      create_params = {name: nil}
      post :create, { user_id: user.id, vaccine: create_params }
      expect(Vaccine.count).to eq(0)
      expect(response).to render_template('new')
    end
    
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: vaccine.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do

    it "returns http success" do
      get :edit, {user_id: user.id, id: vaccine.id}
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      get :edit, {user_id: user.id, id: vaccine.id}
      expect(response).to render_template('edit')
    end
    
  end

  describe "PUT #update" do

    it 'updates a vaccine' do
      vaccine = Vaccine.create(name: 'Vaccine 1')
      update_params = {id: vaccine.id, user_id: user.id, vaccine: {name: 'Vaccine 1'}}
      put :update, update_params
      vaccine = vaccine.reload #need to reload with updated attr to check...
      expect(vaccine.name).to eq('Vaccine 1')
    end

    it 'renders the edit template on error' do
      vaccine = Vaccine.create(name: "Vaccine 1")
      update_params = {id: vaccine.id, user_id: user.id, vaccine: {name: nil}}
      put :update, update_params
      expect(response).to render_template('edit')
    end

  end

  describe "DELETE #destroy" do
    it "destroys the vaccine" do
      vaccine = Vaccine.create(name: "Trip 1")
      expect(Vaccine.count).to eq(1)
      delete :destroy, {id: vaccine.id, user_id: user.id}
      expect(Vaccine.count).to eq(0)
    end
  end

end
