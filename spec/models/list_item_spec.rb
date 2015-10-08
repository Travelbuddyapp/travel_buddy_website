require 'rails_helper'

RSpec.describe ListItem, type: :model do
  describe 'attributes' do
    it { should respond_to(:content) }
    it { should respond_to(:completed) }
    it { should belong_to(:checklist) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:completed) }
  end
end
