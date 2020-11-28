require 'rails_helper'

describe VisitsService do
  let(:user) { create :user }
  let(:page_url) { Faker::Internet.url }

  subject(:visit) { described_class.new(user, page_url) }

  context '#handle_visit!' do
    it 'creates new page visit' do
      expect {
        expect(subject.handle_visit!).to be(true)
      }.to change(PageVisit, :count)
    end
  end
end
