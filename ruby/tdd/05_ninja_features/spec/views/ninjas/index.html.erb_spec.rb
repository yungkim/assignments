require 'rails_helper'

RSpec.describe NinjasController, type: :controller do
    describe "routes for Users" do
        it "'/' routes to ninjas#index" do
            expect(:get => "/").to route_to("ninjas#index")
        end
    end
end
