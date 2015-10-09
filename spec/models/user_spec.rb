require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'attributes' do
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:birth_date) }
    it { should respond_to(:phone_number) }
    it { should respond_to(:gender) }
    it { should have_many(:trips) }
    it { should have_many(:vaccines) }
    it { should have_many(:contacts) }
    it { should have_one(:address) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:gender) }
  end
end
