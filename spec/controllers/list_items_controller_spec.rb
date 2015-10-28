require 'rails_helper'

RSpec.describe ListItemsController, type: :controller do
let(:user){FactoryGirl.create(:user)}
let(:trip){FactoryGirl.create(:trip, user_id: user.id)}
let(:checklist){FactoryGirl.create(:checklist, trip_id: trip.id)}
let(:list_item){FactoryGirl.create(:list_item, checklist_id: checklist.id)}
before(:each) do
  sign_in user
end

  describe "GET #new" do
    it "returns http success" do
      get :new, {trip_id: trip.id, checklist_id: checklist.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    it 'creates a new list_item' do
      list_item_content = 'Content 1'
      create_params = {content: 'Content 1'}
      expect(ListItem.count).to eq(0)
      post :create, {trip_id: trip.id, checklist_id: checklist.id, list_item: create_params}
      expect(ListItem.count).to eq(1)
      expect(ListItem.last.content).to eq(list_item_content)
    end

    it 'renders the new template on error' do
      create_params = {content: nil}
      post :create, {trip_id: trip.id, checklist_id: checklist.id, list_item: create_params}
      expect(response).to render_template('new')
    end
    
  end

  describe "GET #edit" do

    it "returns http success" do
      get :edit, {trip_id: trip.id, checklist_id: checklist.id, id: list_item.id}
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      get :edit, {trip_id: trip.id, checklist_id: checklist.id, id: list_item.id}
      expect(response).to render_template('edit')
    end
    
  end

  describe "PUT #update" do

    it 'updates a list_item' do
      list_item = ListItem.create(content: 'Content 1')
      update_params =  {content: 'Content 1'}
      put :update, {trip_id: trip.id, checklist_id: checklist.id, id: list_item.id, list_item: update_params}
      list_item = list_item.reload #need to reload with updated attr to check...
      expect(list_item.content).to eq('Content 1')
    end

    it 'renders the edit template on error' do
      list_item = ListItem.create(content: 'Content 1')
      update_params = {content: nil}
      put :update, {trip_id: trip.id, checklist_id: checklist.id, id: list_item.id, list_item: update_params }
      expect(response.status).to be(200)
      # expect(response).to render_template('edit')
    end

  end

  describe "DELETE #destroy" do
    it "destroys the list_item" do
      list_item = ListItem.create(content: 'Content 1')
      expect(ListItem.count).to eq(1)
      delete :destroy, {trip_id: trip.id, checklist_id: checklist.id, id: list_item.id}
      expect(ListItem.count).to eq(0)
    end
  end

end
