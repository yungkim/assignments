require "rails_helper"

RSpec.describe DojosController, type: :controller do
    describe "routes for Users" do
      it "'/' routes to dojos#index" do
        expect(:get => "/").to route_to("dojos#index")
      end
      it "'/hello' routes to dojos#world" do
        expect(:get => "/hello").to route_to("dojos#world")
      end
      it "'/ninjas' routes to dojos#ninjas" do
        expect(:get => "/ninjas").to route_to("dojos#ninjas")
      end
    end
end