require 'rails_helper'

RSpec.describe 'Doctor', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
   let!(:doctor_data) { FactoryBot.create(:doctor) }
      before do
        post '/api/v1/doctors', params:
                          { doctor: {
                            name: 'faith',
                            specialization: 'coder',
                            charges: doctor_data.charges
                          } }
      end

      it 'returns a created status' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        post '/api/doctors', params:
                          { doctor: {
                            name: '',
                            specialization: 'coder',
                            charges: 20
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    context 'with invalid parameters' do
      before(:each) do
        post '/api/doctors', params:
                          { doctor: {
                            name: 'okoroji',
                            specialization: '',
                            charges: 20
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    context 'with invalid parameters' do
      before(:each) do
        post '/api/doctors', params:
                          { doctor: {
                            name: 'okoroji',
                            specialization: 'faith9@gmail.com',
                            charges: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end


RSpec.describe 'Doctor', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:doctor, 10)
      get '/api/v1/doctors'
    end
    
    it 'returns all doctors' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end