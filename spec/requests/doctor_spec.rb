require 'rails_helper'

RSpec.describe 'Doctor', type: :request do
  let!(:doctor_data) { FactoryBot.create(:doctor) }
  context 'with valid parameters' do
    before(:each) do
      post '/api/v1/doctors', params:
                        { doctor: {
                          name: doctor_data.name,
                          specialization: doctor_data.specialization,
                          charges: doctor_data.charges,
                          description: doctor_data.description,
                          photo: doctor_data.photo
                        } }
    end

    it 'returns a created status' do
      expect(response).to have_http_status(200)
    end
  end

  context 'with invalid parameters' do
    before(:each) do
      post '/api/v1/doctors', params:
                        { doctor: {
                          name: '',
                          specialization: 'coder',
                          charges: 20,
                          description: 'hello',
                          photo: 'https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
                        } }
    end

    it 'returns a unprocessable entity status' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  context 'with invalid parameters' do
    before(:each) do
      post '/api/v1/doctors', params:
                        { doctor: {
                          name: '',
                          specialization: 'coder',
                          charges: 20,
                          description: '',
                          photo: 'https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
                        } }
    end

    it 'returns a unprocessable entity status' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'with invalid parameters' do
    before(:each) do
      post '/api/v1/doctors', params:
                        { doctor: {
                          name: '',
                          specialization: 'coder',
                          charges: 20,
                          description: 'hello',
                          photo: ''
                        } }
    end

    it 'returns a unprocessable entity status' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'with invalid parameters' do
    before(:each) do
      post '/api/v1/doctors', params:
                        { doctor: {
                          name: 'okoroji',
                          specialization: '',
                          charges: 20,
                          description: 'hello',
                          photo: 'https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
                        } }
    end

    it 'returns a unprocessable entity status' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'with invalid parameters' do
    before(:each) do
      post '/api/v1/doctors', params:
                        { doctor: {
                          name: 'okoroji',
                          description: 'hello',
                          specialization: 'faith9@gmail.com',
                          charges: '',
                          photo: 'https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
                        } }
    end

    it 'returns a unprocessable entity status' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end

RSpec.describe 'Doctor', type: :request do
  context 'GET /index' do
    before(:each) do
      FactoryBot.create_list(:doctor, 10)
      get '/api/v1/doctors'
    end

    it 'returns all doctors' do
      expect(json['doctors'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end
end
