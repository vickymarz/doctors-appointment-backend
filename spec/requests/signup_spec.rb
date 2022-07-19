require 'rails_helper'

RSpec.describe 'Signup', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:user_data) { FactoryBot.create(:user) }

      before do
        post '/api/users', params:
                          { user: {
                            name: 'okorojiebube',
                            email: 'okorojiebube7@gmail.com',
                            password: '123456789'
                          } }
      end

      it 'returns a created status' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        post '/api/users', params:
                          { user: {
                            name: '',
                            email: 'okorojiebube9@gmail.com',
                            password: '123456789'
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    context 'with invalid parameters' do
      before(:each) do
        post '/api/users', params:
                          { user: {
                            name: 'okoroji',
                            email: '',
                            password: '123456789'
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    context 'with invalid parameters' do
      before(:each) do
        post '/api/users', params:
                          { user: {
                            name: 'okoroji',
                            email: 'okorojiebube9@gmail.com',
                            password: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
