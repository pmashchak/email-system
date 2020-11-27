require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }

  context 'associations' do
    it { is_expected.to have_many(:page_visits) }
  end

  context 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }

    it 'validates email' do
      is_expected.not_to allow_value(nil).for(:email)
      is_expected.not_to allow_value('@domain.com').for(:email)
      is_expected.not_to allow_value('user-name@').for(:email)
    end
  end
end
