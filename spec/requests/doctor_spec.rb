require 'rails_helper'

RSpec.describe 'Doctor', type: :request do
  let!(:doctor_data) { FactoryBot.create(:doctor) }
    context 'with valid parameters' do
      before(:each) do
        post '/api/v1/doctors', params:
                          { doctor: {
                            name: doctor_data.name,
                            specialization: doctor_data.specialization,
                            charges: doctor_data.charges
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
                            charges: 20
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
                            charges: 20
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
                            specialization: 'faith9@gmail.com',
                            charges: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
end


RSpec.describe 'Doctor', type: :request do
  context 'GET /index' do
    before(:each)  do
      FactoryBot.create_list(:doctor, 10)
      get '/api/v1/doctors'
    end
    
    it 'returns all doctors' do
      expect(json["doctors"].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end
end

# Rspec.describe 'Doctor', type: :request do
#   before(:each)  { get "/api/v1/doctors/#{1}" } 

#   context 'show' do
#     it 'GET /show status' do
#       expect(response).to have_http_status(200)
#     end

#     it 'GET /show render correct template(show)' do
#       expect(response).to render_template(:show)
#     end

#     it 'GET /show include correct placeholder text' do
#       expect(response.body).to include('Here is a list of posts for a given user')
#     end
#   end
# end