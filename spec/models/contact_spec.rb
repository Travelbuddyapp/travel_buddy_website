require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:phone_number) }
    it { should respond_to(:email) }
    it { should respond_to(:note_field) }
    it { should respond_to(:ice) }
    # it { should belong_to(:trip) }
    # contacts don't belong to a trip, TODO: 
    # maybe validate if trip has emergency contact(ICE)
    it { should belong_to(:user) }
    it { should validate_presence_of(:name) }
  end
end
