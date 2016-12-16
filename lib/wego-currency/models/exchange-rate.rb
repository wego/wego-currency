module WegoCurrency
  class ExchangeRate
    include ActiveModel::Model
    
    attr_accessor :currency_code, :quote
  end
end