# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CollectionController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  let(:collection) { FactoryBot.create(:collection) }

  let(:valid_request) do
    post :create, params: { collection: { name: 'TestCollection', description: 'This is the description for test collection' } },
                  as: :json
  end

  let(:invalid_request) do
    post :create, params: { collection: { name: '', description: '' } },
                  as: :json
  end

  describe '#index' do
    it 'returns a json response' do
      collection
      get :index
      expect(response.parsed_body.first['name']).to eq('TestProduct')
    end
  end

  describe '#create' do
    context 'with guest user' do
      it 'returns an error' do
        valid_request
        expect(response.parsed_body['error']).to eq('You need to sign in or sign up before continuing.')
      end
    end

    context 'with user and valid params' do
      it ' creates a collection' do
        sign_in user
        valid_request
        expect(response.parsed_body['name']).to eq('TestCollection')
      end

      it 'sends out an email for each admin' do
        sign_in user

        expect(CollectionMailer).to receive(:collection_creation).and_call_original

        valid_request
      end
    end

    context 'with user and invalid params' do
      it 'returns an error' do
        sign_in user
        invalid_request

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
