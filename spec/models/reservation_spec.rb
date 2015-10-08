require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'attributes' do
    it { should respond_to(:type) }
    it { should respond_to(:business_name) }
    it { should respond_to(:confirmation_number) }
    it { should respond_to(:note) }
    it { should respond_to(:check_in_date) }
    it { should respond_to(:check_out_date) }
    it { should validate_presence_of(:type) }
    it { should belong_to(:trip) }
    it { should have_one(:address) }
  end
end
