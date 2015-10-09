require 'rails_helper'

RSpec.describe Checklist, type: :model do
  describe 'attributes' do
    it { should respond_to(:title) }
    it { should respond_to(:due_date) }
    it { should belong_to(:trip) }
    it { should belong_to(:user) }
    it { should have_many(:list_items) }
    it { should validate_presence_of(:title) }
  end
end
