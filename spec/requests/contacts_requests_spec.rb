require 'rails_helper'

def json
  JSON.parse(response.body)
end

RSpec.describe 'contacts API', type: :request do

  let!(:contacts) { create_list(:contact, 10) }
  let(:contact_id) { contacts.first.id }
  let(:created_at) {Time.now}

  describe 'GET /contacts' do
    before { get '/contacts' }

    it 'returns contacts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
         expect(response).to have_http_status(200)
       end
     end
end



RSpec.describe 'creating contacts', type: :request do
  let(:valid_attributes) { {first_name: 'Woody', last_name: 'Cowboy', phone_number: '1234567891', email: 'woody@gmail.com', created_at: Time.now} }

  context 'when request attrs are valid' do
    before {post '/contacts', params: valid_attributes}
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
  end

context 'when an invalid request' do
  before {post '/contacts', params: {} }
  it 'returns status code of 422' do
    expect(response).to have_http_status(422)
  end
end
end

RSpec.describe 'viewing one contact', type: :request do
  let!(:contacts) { create_list(:contact, 10) }
  let(:contact_id) { contacts.first.id }
  let(:created_at) {Time.now}

  context 'GET contacts/1' do

    before {get '/contacts/1'}

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

  context "When contact does not exist" do
    before {get '/contacts/0'}

    it 'returns status code of 404' do
      expect(response).to have_http_status(404)
    end
  end

end
