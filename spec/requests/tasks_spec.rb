require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "works! (now write some real specs)" do
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:task, user_id: user.id)
      FactoryGirl.create(:task, user_id: user.id)
      get '/users/1'
      json = JSON.parse(response.body)
      expect(json['data']['relationships']['tasks']['data'].length).to eq(2)
      expect(response).to have_http_status(200)
    end
  end
end
