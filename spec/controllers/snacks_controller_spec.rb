# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SnacksController, type: :controller do
  describe '#index' do
    it 'returns a json response' do
      get :index
      expect(response.parsed_body["snacks"]).to eq('this is the snacks index')
    end
  end
end
