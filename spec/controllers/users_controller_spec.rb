require 'rails_helper'

RSpec.describe UsersController, type: :controller do
let(:user){FactoryGirl.create(:user)}

  describe "GET #show" do
    it "shows a user" do
      # expect(User.count).to eq(0)
      # user1 = user
      # users = create_list(:user, 1, first_name: 'Doctor Spock')
      # doctors = create_list(:doctor, 1, name: 'Doctor McCoy', userhm_id: user2.id)
      # get :show
      binding.pry
      # expect(User.count).to eq(1)
      # expect(user1.first_name).to eq('Doctor Spock')
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, {id: user.id}
      expect(response).to have_http_status(:success)
    end
  end

end
