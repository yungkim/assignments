require 'rails_helper'

RSpec.describe NinjasController, type: :controller do
    describe "routes for Ninjas" do
        it "'success' routes to ninjas#success" do
            expect(:get => "success").to route_to("ninjas#success")
        end
    end
end
