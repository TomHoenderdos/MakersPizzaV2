require "rails_helper"

RSpec.describe PizzasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pizza").to route_to("pizzas#index")
    end

    it "routes to #new" do
      expect(:get => "/pizza/new").to route_to("pizzas#new")
    end

    it "routes to #show" do
      expect(:get => "/pizza/1").to route_to("pizzas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pizza/1/edit").to route_to("pizzas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pizza").to route_to("pizzas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pizza/1").to route_to("pizzas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pizza/1").to route_to("pizzas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pizza/1").to route_to("pizzas#destroy", :id => "1")
    end

  end
end
