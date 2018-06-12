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

  
  describe '#convert_invalid_currency_code' do 
    it 'returns error' do
      begin
        WegoCurrency::Client.convert_amount(100, 'ABC', 'PHP')
      rescue StandardError => e
        expect(e.message).to eql "Unknown currency 'abc'"
      end
    end
  end
  
  describe 'check if currency code valid' do
    it 'returns true' do 
      allow(WegoCurrency::Client).to receive(:all_currencies).and_return([:sgd,:usd])
      response = WegoCurrency::Client.is_currency_code_valid?("sgd")
      expect(response).to eq true
    end

    it 'accepts symbol or string' do
      allow(WegoCurrency::Client).to receive(:all_currencies).and_return([:sgd,:usd])
      response = WegoCurrency::Client.is_currency_code_valid?(:usd)
      expect(response).to eq true
      response = WegoCurrency::Client.is_currency_code_valid?("USD")
      expect(response).to eq true
    end

    it 'returns false' do 
      allow(WegoCurrency::Client).to receive(:all_currencies).and_return([:sgd,:usd])
      response = WegoCurrency::Client.is_currency_code_valid?("abc")
      expect(response).to eq false

      response = WegoCurrency::Client.is_currency_code_valid?(nil)
      expect(response).to eq false
    end
  end
end
