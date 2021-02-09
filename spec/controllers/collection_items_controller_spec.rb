# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CollectionItemsController, type: :controller do
  let(:collection_item) { FactoryBot.create(:collection_item) }

  let(:user) { FactoryBot.create(:user, email: 'user2@email.com') }

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

    let(:invalid_request) do
      post :create, params: { collection_id: collection.id,
                              collection_item: {
                                name: ''
                              } },
                    as: :json
    end

    context 'with guest user' do
      it 'returns an error' do
        valid_request
        expect(response.parsed_body['error']).to eq('You need to sign in or sign up before continuing.')
      end
    end

    context 'with user and valid params' do
      it ' creates a collection' do
        sign_in collection.user
        valid_request
        expect(response.parsed_body['name']).to eq('Test CollectionItem')
      end

      context 'with user and invalid params' do
        it 'returns an error' do
          sign_in collection.user
          invalid_request

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'with user who is not the collection owner' do
        it 'returns an error' do
          sign_in user

          expect { valid_request }.to raise_error Pundit::NotAuthorizedError
        end
      end
    end
  end

  describe '#show' do
    it 'returns a json response' do
      get :show, params: { collection_id: collection_item.collection.id, id: collection_item.id }
      expect(response.parsed_body['name']).to eq('CollectionItem name')
    end
  end

  describe '#update' do
    let(:valid_request) do
      put :update, params: { collection_id: collection_item.collection.id,
                             id: collection_item.id,
                             collection_item: {
                               name: 'Test CollectionItem updated'
                             } },
                   as: :json
    end

    let(:invalid_request) do
      put :update, params: { collection_id: collection_item.collection.id,
                             id: collection_item.id,
                             collection_item: {
                               name: ''
                             } },
                   as: :json
    end

    context 'with guest user' do
      it 'returns an error' do
        valid_request
        expect(response.parsed_body['error']).to eq('You need to sign in or sign up before continuing.')
      end
    end

    context 'with user and valid params' do
      it ' creates a collection' do
        sign_in collection_item.collection.user
        valid_request
        expect(response.parsed_body['name']).to eq('Test CollectionItem updated')
      end
    end

    context 'with user and invalid params' do
      it 'returns an error' do
        sign_in collection_item.collection.user
        invalid_request

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with user who is not the collection owner' do
      it 'returns an error' do
        sign_in user

        expect { valid_request }.to raise_error Pundit::NotAuthorizedError
      end
    end
  end
end
