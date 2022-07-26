# require 'swagger_helper'

# RSpec.describe 'users/sessions', type: :request do
#   path '/api/users/sign_in' do
#     post('create session') do
#       response(200, 'successful') do
#         consumes 'application/json'
#         parameter name: :registration, in: :body, schema: {
#           type: :object,
#           properties: {
#             name: { type: :string },
#             password: { type: :string }
#           },
#           required: %w[name password]
#         }

#         after do |example|
#           example.metadata[:response][:content] = {
#             'application/json' => {
#               example: JSON.parse(response.body, symbolize_names: true)
#             }
#           }
#         end
#         run_test!
#       end
#     end
#   end

#   path '/api/users/sign_out' do
#     delete('delete session') do
#       response(200, 'successful') do
#         after do |example|
#           example.metadata[:response][:content] = {
#             'application/json' => {
#               example: JSON.parse(response.body, symbolize_names: true)
#             }
#           }
#         end
#         run_test!
#       end
#     end
#   end
# end
