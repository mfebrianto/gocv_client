require 'rails_helper'

describe ClientsController do

  let(:first_name) {'michael'}

  describe 'create' do
    it 'should return json of client' do
      post :create, format: :json, client: {first_name: first_name , last_name: 'febrianto',
                                            dob: 20.year.ago, male_gender: true}
      expect(ActiveSupport::JSON.decode(response.body)['first_name']).to eq first_name
    end
  end

end