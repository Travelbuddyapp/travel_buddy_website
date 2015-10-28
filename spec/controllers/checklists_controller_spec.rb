require 'rails_helper'

RSpec.describe ChecklistsController, type: :controller do
let(:user){FactoryGirl.create(:user)}
let(:trip){FactoryGirl.create(:trip, user_id: user.id)}
let(:checklist){FactoryGirl.create(:checklist, trip_id: trip.id)}
before(:each) do
  sign_in user
end

  describe "GET #index" do
    it "returns http success" do
      get :index, {trip_id: trip.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, {trip_id: trip.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    it 'creates a new checklist' do
      checklist_title = 'Title 1'
      create_params = {title: 'Title 1'}
      expect(Checklist.count).to eq(0)
      post :create, {trip_id: trip.id, checklist: create_params}
      expect(Checklist.count).to eq(1)
      expect(Checklist.last.title).to eq(checklist_title)
    end

    it 'renders the new template on error' do
      create_params = {title: nil}
      post :create, {trip_id: trip.id, checklist: create_params}
      expect(response).to render_template('new')
    end
    
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {trip_id: trip.id, id: checklist.id}
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #edit" do

    it "returns http success" do
      get :edit, {trip_id: trip.id, id: checklist.id}
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      get :edit, {trip_id: trip.id, id: checklist.id}
      expect(response).to render_template('edit')
    end
    
  end

  describe "PUT #update" do

    it 'updates a checklist' do
      checklist = Checklist.create(title: 'Title 1')
      update_params =  {title: 'Title 1'}
      put :update, {trip_id: trip.id, id: checklist.id, checklist: update_params}
      checklist = checklist.reload #need to reload with updated attr to check...
      expect(checklist.title).to eq('Title 1')
    end

    it 'renders the edit template on error' do
      checklist = Checklist.create(title: 'Title 1')
      update_params = {title: nil}
      put :update, {trip_id: trip.id, id: checklist.id, checklist: update_params }
      # expect(flash[:error]).to be_present
      # expect(controller).to set_flash[:error].now
      # expect(response).to render_template('edit')
    end

  end

  describe "DELETE #destroy" do
    it "destroys the checklist" do
      checklist = Checklist.create(title: 'Title 1')
      expect(Checklist.count).to eq(1)
      delete :destroy, {trip_id: trip.id, id: checklist.id}
      expect(Checklist.count).to eq(0)
    end
  end
  
end
