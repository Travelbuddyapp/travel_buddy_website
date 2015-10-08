require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:expiration_date) }
    it { should belong_to(:user) }
    it { should validate_presence_of(:name) }
  end
end
