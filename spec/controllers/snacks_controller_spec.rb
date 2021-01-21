require 'rails_helper'

RSpec.describe SnacksController, :type => :controller do
  describe "#index" do
    it "returns a json response" do
      get :index
      expect(response.body).to include('this is the snacks index')
    end
  end
end
