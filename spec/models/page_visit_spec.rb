require 'rails_helper'

RSpec.describe PageVisit, type: :model do
  subject { build :page_visit }

  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:host) }
    it { is_expected.to validate_presence_of(:path) }
  end
end
