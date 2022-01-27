require 'rails_helper'

RSpec.describe "Types", type: :request do
  describe "GET /types" do
    it "works!" do
      get types_path
      expect(response).to have_http_status(200)
    end
  end
end
