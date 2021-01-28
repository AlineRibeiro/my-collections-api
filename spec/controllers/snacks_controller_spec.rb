# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SnacksController, type: :controller do
  describe '#index' do
    # it 'returns a json response' do
    #   get :index
    #   expect(response.parsed_body['snacks']).to eq('this is the snacks index')
    # end
  end

  describe '#create' do
    context 'with guest user' do
      it 'returns an error' do
        post :create, params:  { snack: { name: 'TestSnack', description: 'This is the description for test snack'} }, as: :json
        expect(response.parsed_body['error']).to eq('You need to sign in or sign up before continuing.')
      end
    end
    context 'with user and valid params' do
      # it 'returns an error' do
      #   post :create, params:  { snack: { name: 'TestSnack', description: 'This is the description for test snack'} }, as: :json
      #   expect(response.parsed_body['error']).to eq('You need to sign in or sign up before continuing.')
      # end
    context 'with user and invalid params' do
      # it 'returns an error' do
      #   post :create, params:  { snack: { name: 'TestSnack', description: 'This is the description for test snack'} }, as: :json
      #   expect(response.parsed_body['error']).to eq('You need to sign in or sign up before continuing.')
      # end
    end
    end
  end
end

# context - with user
# teste para user logado parametros validos - consegue criar um snack sem problemas
# teste para user logado, mas com parametros invalidos - ver se api retorna uma mensagem de erro
