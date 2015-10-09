require 'rails_helper'

RSpec.describe Vaccine, type: :model do
  describe 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:details) }
    it { should respond_to(:administration_method) }
    it { should respond_to(:date_given) }
    it { should respond_to(:expiration_date) }
    it { should belong_to(:user) }
  end
end
