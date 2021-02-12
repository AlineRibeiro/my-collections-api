# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  let(:company) { FactoryBot.create(:company) }

  let(:valid_request) do
    post :create, params: { company: { name: 'TestCompany', description: 'This is the description for test company' } },
                  as: :json
  end

  let(:invalid_request) do
    post :create, params: { company: { name: '', description: '' } },
                  as: :json
  end

  describe '#index' do
    it 'returns a json response' do
      company
      get :index
      expect(response.parsed_body.first['name']).to eq('TestCompany')
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
      it ' creates a company' do
        sign_in user
        valid_request
        expect(response.parsed_body['name']).to eq('TestCompany')
      end

      it 'enqueues an active job to send out an email for each admin' do
        sign_in user

        ActiveJob::Base.queue_adapter = :test

        expect { valid_request }.to have_enqueued_job
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
