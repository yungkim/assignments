require 'rails_helper'

RSpec.describe DojosController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #world" do
    it "returns http success" do
      get :world
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #ninjas" do
    it "returns http success" do
      get :ninjas
      expect(response).to have_http_status(:success)
    end
  end

end
