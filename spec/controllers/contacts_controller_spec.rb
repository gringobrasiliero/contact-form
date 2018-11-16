require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

    describe 'Get /contacts' do
      it 'returns a status message' do
        get('/contacts')
        json = JSON.parse(response.body)
        expect(json['status']).to eql('ok')
      
    end
  end

end
