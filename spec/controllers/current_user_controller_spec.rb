# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrentUserController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe '#show' do
    it 'returns a json response for user' do
      sign_in user
      get :show

      expect(response.parsed_body['email']).to eq('test@test.com')
    end

    it 'returns a json response for guest user' do
      sign_out user
      get :show, as: :json

      expect(response.parsed_body['error']).to eq('You need to sign in or sign up before continuing.')
    end
  end
end
