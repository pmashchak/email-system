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

  context '.weekly' do
    let(:user) { create :user }

    it 'returns visits only 7 days ago' do
      first_visit = create(:page_visit, user: user, created_at: 8.days.ago)
      second_visit = create(:page_visit, user: user, created_at: 3.days.ago)
      page_visits = described_class.weekly

      expect(page_visits).to include(second_visit)
      expect(page_visits).not_to include(first_visit)
    end
  end
end
