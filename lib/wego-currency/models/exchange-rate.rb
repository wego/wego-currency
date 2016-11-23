module Wego
  module Currency
    class ExchangeRate
      include ActiveModel::Model
      
      attr_accessor :currency_code, :quote
    end
  end
end