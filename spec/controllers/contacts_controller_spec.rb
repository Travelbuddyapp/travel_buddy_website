require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

 let(:user){FactoryGirl.create(:user)}
  let(:contact){FactoryGirl.create(:contact, user_id: user.id)}
  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, {user_id: user.id, id: contact.id}
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

    it 'creates a new contact' do
      contact_name = 'Contact 1'
      create_params = {name: 'Contact 1'}
      expect(Contact.count).to eq(0)
      post :create, { user_id: user.id, contact: create_params }
      expect(Contact.count).to eq(1)
      expect(Contact.first.name).to eq(contact_name)
    end

    it 'renders the new template on error' do
      create_params = {name: nil}
      post :create, { user_id: user.id, contact: create_params }
      expect(Contact.count).to eq(0)
      expect(response).to render_template('new')
    end
    
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: contact.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do

    it "returns http success" do
      get :edit, {user_id: user.id, id: contact.id}
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      get :edit, {user_id: user.id, id: contact.id}
      expect(response).to render_template('edit')
    end
    
  end

  describe "PUT #update" do

    it 'updates a contact' do
      contact = Contact.create(name: 'Contact 1')
      update_params =  {name: 'Contact 1'}
      put :update, {id: contact.id, contact: update_params }
      contact = contact.reload #need to reload with updated attr to check...
      expect(contact.name).to eq('Contact 1')
    end

    it 'renders the edit template on error' do
      contact = Contact.create(name: 'Contact 1')
      update_params = {name: nil}
      put :update, {id: contact.id, contact: update_params }
      expect(response).to render_template('edit')
    end

  end

  describe "DELETE #destroy" do
    it "destroys the contact" do
      contact = Contact.create(name: "Contact 1")
      expect(Contact.count).to eq(1)
      delete :destroy, {id: contact.id}
      expect(Contact.count).to eq(0)
    end
  end

end
