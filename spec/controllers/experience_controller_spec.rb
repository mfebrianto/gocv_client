require 'rails_helper'

describe ExperiencesController do

  let(:company_name) {'gocv.com.au'}

  describe 'create' do
    it 'should return json of experience' do
      post :create, format: :json, experience: {client_id: '1', company_name: company_name, position: 'developer',
                                                started_on: Time.now, ended_on: Time.now, current_job: false}
      expect(ActiveSupport::JSON.decode(response.body)['company_name']).to eq company_name
    end
  end
end