require 'rails_helper'

RSpec.describe ListItem, type: :model do
  describe 'attributes' do
    it { should respond_to(:content) }
    it { should respond_to(:completed) }
    it { should belong_to(:checklist) }
    it { should validate_presence_of(:content) }
    # TODO: validate boolean value of completed...
    # it { should validate_presence_of(:completed) }
    # expect(:completed).to be_in([true, false])
  end

end
