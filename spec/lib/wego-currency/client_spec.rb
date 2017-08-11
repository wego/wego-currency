require 'spec_helper'

RSpec.describe WegoCurrency::Client do

  let(:eur) { 'EUR' }
  let(:sgd) { 'SGD'}
  let(:amount) { "1000" }

  describe '#exchange_rates' do

    it 'returns reponse proto' do
      exchange_rates_response = WegoCurrency::Client.exchange_rates
      expect(exchange_rates_response.class).to be WegoCurrency::Api::Response
    end

    it 'returns with default_currency_code' do
      exchange_rates_response = WegoCurrency::Client.exchange_rates
      expect(exchange_rates_response.base_currency_code).to eq 'USD'
    end

  end

  describe '#convert_amount' do

    it 'returns amount' do
      WegoCurrency::Client.convert_amount(100, 'SGD', 'PHP')
    end


  end
end
