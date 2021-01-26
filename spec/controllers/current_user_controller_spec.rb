# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrentUserController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe '#show' do
    it 'returns a json response' do
      sign_in user
      get :show

      expect(response.body).to include("test@test.com")
    end
  end
end
