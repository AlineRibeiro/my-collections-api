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

  describe '#create' do
    let(:collection) { FactoryBot.create(:collection) }

    let(:valid_request) do
      post :create, params: { collection_id: collection.id,
                              collection_item: {
                                name: 'Test CollectionItem',
                                description: 'This is the description for test CollectionItem'
                              } },
                    as: :json
    end

    context 'with guest user' do
      it 'returns an error' do
        valid_request
        expect(response.parsed_body['error']).to eq('You need to sign in or sign up before continuing.')
      end
    end

    # context 'with user and valid params' do
    #   it ' creates a collection' do
    #     sign_in user
    #     valid_request
    #     expect(response.parsed_body['name']).to eq('TestCollection')
    #   end
    #
    #   it 'enqueues an active job to send out an email for each admin' do
    #     sign_in user
    #
    #     ActiveJob::Base.queue_adapter = :test
    #
    #     expect { valid_request }.to have_enqueued_job
    #   end
    # end

    # context 'with user and invalid params' do
    #   it 'returns an error' do
    #     sign_in user
    #     invalid_request
    #
    #     expect(response).to have_http_status(:unprocessable_entity)
    #   end
    # end
  end
end
