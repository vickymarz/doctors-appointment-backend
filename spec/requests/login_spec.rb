require 'rails_helper'

RSpec.describe 'Signin', type: :request do
  describe 'POST /create' do
    context 'with invalid parameters' do
      before(:each) do
        post '/api/users/sign_in', params:
                          { user: {
                            name: '',
                            password: '123456789'
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context 'with invalid parameters' do
      before(:each) do
        post '/api/users/sign_in', params:
                          { user: {
                            name: 'okoroji',
                            email: '',
                            password: '123456789'
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context 'with invalid parameters' do
      before(:each) do
        post '/api/users/sign_in', params:
                          { user: {
                            name: 'okoroji',
                            email: 'okorojiebube9@gmail.com',
                            password: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
