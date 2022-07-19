# require 'rails_helper'

# RSpec.describe 'Signup', type: :request do
#   describe 'POST /create' do
#     context 'with valid parameters' do
#       let!(:user_data) { FactoryBot.create(:user) }

#       before do
#         post '/api/users', params:
#                           { user: {
#                             name: user_data.name,
#                             email: user_data.email,
#                             password: user_data.password
#                           } }
#       end

#       it 'returns the name' do
#         expect(json['name']).to eq(user_data.name)
#       end

#       it 'returns the email' do
#         expect(json['email']).to eq(user_data.email)
#       end

#       it 'returns a created status' do
#         expect(response).to have_http_status(200)
#       end
#     end

#     context 'with invalid parameters' do
#       before(:each) do
#         post '/api/users', params:
#                           { user: {
#                             "name": '',
#                             "email": '',
#                             "password": ''
#                           } }
#       end

#       it 'returns a unprocessable entity status' do
#         expect(response).to have_http_status(:unprocessable_entity)
#       end
#     end
#   end
# end
