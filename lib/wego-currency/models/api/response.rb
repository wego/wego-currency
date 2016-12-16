module WegoCurrency
  module Api
    class Response
      include ActiveModel::Model
      
      attr_accessor :headers, :base_currency_code, :exchange_rates
    end
  end
end