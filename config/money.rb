# encoding: utf-8

require 'money/bank/open_exchange_rates_bank'
require 'money'
moe = Money::Bank::OpenExchangeRatesBank.new
moe.secure_connection = true
moe.cache = Pathname.new(WegoCurrency.root).join('public', 'exchange_rates.json').to_s
moe.app_id = '01f9f07f87ae417ab69f464d6b87ae26'
moe.update_rates
Money.default_bank = moe

# we don't want to use some of the defaults that come with Money
# set our own symbols in these cases
currencies = Money::Currency.table
currencies[:aed][:symbol] = 'AED'
currencies[:sar][:symbol] = 'SAR'
currencies[:sgd][:symbol] = 'S$'
currencies[:aud][:symbol] = 'A$'
currencies[:cad][:symbol] = 'C$'
currencies[:hkd][:symbol] = 'HK$'
currencies[:nzd][:symbol] = 'NZ$'
currencies[:clp][:symbol] = 'CLP$'
currencies[:cop][:symbol] = 'COL$'
currencies[:mxn][:symbol] = 'MEX$'
currencies[:usd][:symbol] = 'US$'
currencies[:tnd][:symbol] = 'TND'
currencies[:twd][:symbol] = 'NT$'
currencies[:dzd][:symbol] = 'DZD'
currencies[:mad][:symbol] = 'MAD'
currencies[:egp][:symbol] = 'EGP'
currencies[:eur][:symbol_first] = false
currencies[:eur][:thousands_separator] = ' '
currencies[:tnd][:symbol_first] = true
currencies[:twd][:symbol_first] = true
currencies[:dzd][:symbol_first] = true
currencies[:mad][:symbol_first] = true
currencies[:rub][:symbol_first] = false
currencies[:rub][:thousands_separator] = ' '
currencies[:vnd][:symbol_first] = false
