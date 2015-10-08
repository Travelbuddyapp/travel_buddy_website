require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'attributes' do
    it { should respond_to(:latitude) }
    it { should respond_to(:longitude) }
    it { should respond_to(:address) }
    it { should validate_presence_of(:address) }
    it { should belong_to(:user) }
    it { should belong_to(:reservation) }
  end
end
