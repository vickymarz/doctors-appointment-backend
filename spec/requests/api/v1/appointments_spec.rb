require 'swagger_helper'

RSpec.describe 'api/v1/appointments', type: :request do
  let(:user) do
    create(:user, name: 'lynette', email: 'lynette22@gmail.com', password: '1234567890')
  end

  before do
    sign_in(user)
  end

  let(:doctor) { FactoryBot.create(:doctor) }
  let(:appointment) do
    create(:appointment,
           name: 'faith',
           city: 'china',
           date: '2022-10-20',
           doctor:,
           user:)
  end

  path '/api/v1/users/{user_id}/appointments' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list appointments') do
      response(200, 'successful') do
        let(:user_id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create appointment') do
      response(201, 'successful') do
        let(:user_id) { '1' }

        consumes 'application/json'
        parameter name: :appointment, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            city: { type: :string },
            date: { type: :integer }
          },
          required: %w[name city date]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/appointments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete appointment') do
      before(:each) do
        create(:appointment, id: '1',
                             name: 'faith',
                             city: 'china',
                             date: '20-10-2022',
                             doctor:,
                             user:)
      end
      response(200, 'successful') do
        let(:user_id) { '1' }
        let(:id) { '1' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
