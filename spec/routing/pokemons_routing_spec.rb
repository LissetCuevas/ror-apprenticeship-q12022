require "rails_helper"

RSpec.describe PokemonController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/pokemon").to route_to("pokemon#index")
    end

    it "routes to #new" do
      expect(:get => "/pokemon/new").to route_to("pokemon#new")
    end

    it "routes to #show" do
      expect(:get => "/pokemon/1").to route_to("pokemon#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pokemon/1/edit").to route_to("pokemon#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pokemon").to route_to("pokemon#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pokemon/1").to route_to("pokemon#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pokemon/1").to route_to("pokemon#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pokemon/1").to route_to("pokemon#destroy", :id => "1")
    end
  end
end
