module WegoCurrency
  class Client
    
    def self.exchange_rates
      headers = WegoCurrency::Api::Headers.new message: 'Success', status_code: 200

      exchange_rates = Money.default_bank.update_rates.collect do |currency_code, quote|
        WegoCurrency::ExchangeRate.new(currency_code: currency_code, quote: quote)
      end

      base_currency_code = 'USD'

      WegoCurrency::Api::Response.new(
        exchange_rates: exchange_rates, 
        base_currency_code: base_currency_code,
        headers: headers,
      )
    end

    def self.convert_amount(amount, currency_code, new_currency_code)
      Rails.try(:cache) && Rails.cache.fetch("WegoCurrency::ExchangeRates", expires_in: 6.hours) do
        update_rates
      end
      subunit_to_unit = (Money::Currency.table[currency_code.downcase.to_sym] || {})[:subunit_to_unit] || 100
      Money.new(amount.to_f * subunit_to_unit, currency_code).exchange_to('USD').exchange_to(new_currency_code).amount
    end

    def self.convert_amount_usd(amount_usd, new_currency_code)
      convert_amount(amount_usd, 'USD', new_currency_code)
    end

    private

    def self.update_rates
      Money.default_bank.update_rates
    end
  end
end