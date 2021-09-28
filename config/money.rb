# encoding: utf-8

require 'open-uri'
require 'money/bank/wego_money_bank'
require 'money'

# monkeypatching because we can't push new version to rubygems.org as we don't
# own the account
module Money
  module Bank
    class WegoMoneyBank
      def fetch_from_url
        URI.open(url).read
      end
    end
  end
end

moe = Money::Bank::WegoMoneyBank.new
moe.cache = Pathname.new(Dir.pwd).join('public', 'exchange_rates.json').to_s
moe.ttl_in_seconds = 3600

moe.update_rates
Money.default_bank = moe
Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN

# we don't want to use some of the defaults that come with Money
# set our own symbols in these cases
currencies = Money::Currency.table
currencies[:sgd][:symbol] = 'S$'
currencies[:aud][:symbol] = 'A$'
currencies[:cad][:symbol] = 'C$'
currencies[:hkd][:symbol] = 'HK$'
currencies[:nzd][:symbol] = 'NZ$'
currencies[:clp][:symbol] = 'CLP$'
currencies[:cop][:symbol] = 'COL$'
currencies[:mxn][:symbol] = 'MEX$'
currencies[:usd][:symbol] = 'US$'
currencies[:twd][:symbol] = 'NT$'

currencies[:aed][:symbol] = 'AED'
currencies[:aed][:symbol_first] = true
currencies[:sar][:symbol] = 'SAR'
currencies[:sar][:symbol_first] = true
currencies[:mad][:symbol] = 'MAD'
currencies[:mad][:symbol_first] = true
currencies[:dzd][:symbol] = 'DZD'
currencies[:dzd][:symbol_first] = true
currencies[:tnd][:symbol] = 'TND'
currencies[:tnd][:symbol_first] = true
currencies[:bhd][:symbol] = 'BHD'
currencies[:bhd][:symbol_first] = true
currencies[:jod][:symbol] = 'JOD'
currencies[:jod][:symbol_first] = true
currencies[:kwd][:symbol] = 'KWD'
currencies[:kwd][:symbol_first] = true
currencies[:omr][:symbol] = 'OMR'
currencies[:omr][:symbol_first] = true
currencies[:qar][:symbol] = 'QAR'
currencies[:qar][:symbol_first] = true
currencies[:egp][:symbol] = 'EGP'
currencies[:egp][:symbol_first] = true
currencies[:irr][:symbol] = 'IRR'
currencies[:irr][:symbol_first] = true

currencies[:eur][:symbol_first] = false
currencies[:eur][:thousands_separator] = ' '
currencies[:tnd][:symbol_first] = true
currencies[:twd][:symbol_first] = true
currencies[:dzd][:symbol_first] = true
currencies[:mad][:symbol_first] = true
currencies[:rub][:symbol_first] = false
currencies[:rub][:thousands_separator] = ' '
currencies[:vnd][:symbol_first] = false
currencies[:pln][:thousands_separator] = ' '
currencies[:sek][:thousands_separator] = ' '

# african sites currencies
currencies[:kes][:symbol] = 'KSh'
currencies[:tzs][:symbol] = 'TSh'
currencies[:etb][:symbol] = 'Br'
currencies[:etb][:symbol_first] = true
currencies[:ugx][:symbol] = 'USh'
currencies[:ugx][:symbol_first] = true
currencies[:xof][:symbol] = 'CFA'
currencies[:xof][:thousands_separator] = ' '
currencies[:cdf][:symbol] = 'FC'
currencies[:cdf][:thousands_separator] = ' '
currencies[:zmw][:symbol] = 'K'
currencies[:aoa][:symbol] = 'Kz'
currencies[:aoa][:thousands_separator] = ' '
currencies[:mzn][:symbol] = 'Mtn'
currencies[:mzn][:symbol_first] = false
currencies[:mzn][:thousands_separator] = ' '
currencies[:xaf][:symbol] = 'FCFA'
currencies[:xaf][:thousands_separator] = ' '
currencies[:rwf][:symbol] = 'Rf'
currencies[:nad][:symbol] = 'N$'
currencies[:nad][:symbol_first] = true
currencies[:bwp][:symbol] = 'P'
currencies[:mur][:symbol] = 'Rs'


currencies.each do |key,currency|
  Money::Currency.register(currency)
end

Money.locale_backend = :currency
