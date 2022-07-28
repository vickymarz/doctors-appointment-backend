require 'swagger_helper'

RSpec.describe 'api/v1/doctors', type: :request do
  path '/api/v1/doctors' do
    get('list doctors') do
      before(:each) do
        FactoryBot.create_list(:doctor, 10)
      end
      response(200, 'successful') do
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

    post('create doctor') do
      let(:doctor) do
        create(:doctor, name: 'lynette',
                        specialization: 'coder',
                        charges: 20,
                        description: 'hello',
                        photo: 'https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')
      end
      response(200, 'Doctor added successfully') do
        consumes 'application/json'
        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string },
            specialization: { type: :string },
            charges: { type: :integer },
            photo: { type: :string }
          },
          required: %w[name description specialization charges photo]
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

  path '/api/v1/doctors/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show doctor') do
      before(:each) do
        create(:doctor, id: '1',
                        name: 'lynette',
                        specialization: 'coder',
                        charges: 20,
                        description: 'hello',
                        photo: 'https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')
      end
      response(201, 'successful') do
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

    delete('delete doctor') do
      before(:each) do
        create(:doctor, id: '15',
                        name: 'lynette',
                        specialization: 'coder',
                        charges: 20,
                        description: 'hello',
                        photo: 'https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')
      end
      response(200, 'successful') do
        let(:id) { '15' }

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
