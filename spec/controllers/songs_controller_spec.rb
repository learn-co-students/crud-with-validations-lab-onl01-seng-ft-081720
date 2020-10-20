require 'rails_helper'

RSpec.describe SongsController, type: :controller do

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: 3
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: 3
      expect(response).to have_http_status(:success)
    end
  end

end
