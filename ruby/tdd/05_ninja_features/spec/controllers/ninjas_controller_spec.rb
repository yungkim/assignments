require 'rails_helper'

RSpec.describe NinjasController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "raise error without parameters missing" do
      expect{ post(:create, {}) }.to raise_error ActionController::ParameterMissing
    end
  end

end
