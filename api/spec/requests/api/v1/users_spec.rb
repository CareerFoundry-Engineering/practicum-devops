# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /index" do
    subject(:request_index) do
      get '/api/v1/users'
    end
    let!(:user) { create(:user) }
    let(:the_response) { JSON.parse(response.body) }
    let(:expected_response) do
      {
        data: [{
          name: user.name,
          ocupation: user.ocupation,
          email: user.email,
          bio: user.bio,
          uuid: user.uuid,
          avatar_url: user.avatar_url
        }],
        message: ["User list fetched successfully"],
        status: 200,
        type: "Success"
      }.as_json
    end

    before do
      
      request_index
    end

    it 'returns a list of users' do
      expect(the_response).to match(expected_response)
    end
  end
end
