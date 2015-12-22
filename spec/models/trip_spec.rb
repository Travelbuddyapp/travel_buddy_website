require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:ice_id) }
    it { should have_many(:checklists) }
    it { should have_many(:reservations) }
    it { should belong_to(:user) }
    # TODO: validate presence and maybe uniqueness
    #        of ice_id for emergency contact.
    # it { should serialize(:ice_id) }
    it { should validate_presence_of(:name) }
  end
end
