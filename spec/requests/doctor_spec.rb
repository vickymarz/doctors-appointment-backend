require 'rails_helper'

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