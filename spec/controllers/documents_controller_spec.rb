require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  let(:user){FactoryGirl.create(:user)}
  let(:document){FactoryGirl.create(:document, user_id: user.id)}
  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, {user_id: user.id, id: document.id}
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

    it 'creates a new document' do
      doc_name = 'Document 1'
      create_params = {name: 'Document 1'}
      expect(Document.count).to eq(0)
      post :create, { user_id: user.id, document: create_params }
      expect(Document.count).to eq(1)
      expect(Document.first.name).to eq(doc_name)
    end

    it 'renders the new template on error' do
      create_params = {name: nil}
      post :create, { user_id: user.id, document: create_params }
      expect(Document.count).to eq(0)
      expect(response).to render_template('new')
    end
    
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: document.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do

    it "returns http success" do
      get :edit, {user_id: user.id, id: document.id}
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      get :edit, {user_id: user.id, id: document.id}
      expect(response).to render_template('edit')
    end
    
  end

  describe "PUT #update" do

    it 'updates a document' do
      document = Document.create(name: 'Document 1')
      update_params =  {name: 'Document 1'}
      put :update, {id: document.id, document: update_params }
      document = document.reload #need to reload with updated attr to check...
      expect(document.name).to eq('Document 1')
    end

    it 'renders the edit template on error' do
      document = Document.create(name: 'Document 1')
      update_params = {name: nil}
      put :update, {id: document.id, document: update_params }
      expect(response).to render_template('edit')
    end

  end

  describe "DELETE #destroy" do
    it "destroys the document" do
      document = Document.create(name: "Document 1")
      expect(Document.count).to eq(1)
      delete :destroy, {id: document.id}
      expect(Document.count).to eq(0)
    end
  end

end
