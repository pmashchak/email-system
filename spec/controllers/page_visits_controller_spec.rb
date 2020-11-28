require 'rails_helper'

RSpec.describe PageVisitsController, type: :controller do
  describe 'POST #create' do
    let(:email) { create(:user).email }
    let(:page_url) { Faker::Internet.url }

    it 'creates page visit' do
      expect {
        post :create, params: { email: email, page_url: page_url }
      }.to change(PageVisit, :count)
      expect(response).to have_http_status(:ok)
    end

    context 'when user does not exist' do
      let(:email) { Faker::Internet.email }

      it 'raises user not found error' do
        expect {
          post :create, params: { email: email, page_url: page_url }
        }.not_to change(PageVisit, :count)
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when page_url is wrong format' do
      let(:page_url) { 'test' }

      it 'raises user not found error' do
        expect {
          post :create, params: { email: email, page_url: page_url }
        }.not_to change(PageVisit, :count)
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
