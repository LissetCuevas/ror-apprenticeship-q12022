require 'rails_helper'

RSpec.describe "Abilities", type: :request do
  describe "GET /abilities" do
    it "works!" do
      get abilities_path
      expect(response).to have_http_status(200)
    end
  end
end
