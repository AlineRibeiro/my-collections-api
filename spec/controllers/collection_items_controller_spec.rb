# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CollectionItemsController, type: :controller do

  let(:collection_item) { FactoryBot.create(:collection_item) }

  describe '#index' do
    it 'returns a json response' do
      get :index, params: { collection_id: collection_item.collection.id }
      expect(response.parsed_body.first['name']).to eq('CollectionItem name')
    end
  end
end
