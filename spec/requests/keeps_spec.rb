require 'rails_helper'

RSpec.describe "Keeps", type: :request do
  describe "GET /keeps" do
    it "works! (now write some real specs)" do
      get keeps_path
      expect(response).to have_http_status(200)
    end
  end
end
