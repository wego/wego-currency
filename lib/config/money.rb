# encoding: utf-8

require 'money/bank/wego_money_bank'
require 'money'

moe = Money::Bank::WegoMoneyBank.new
moe.cache = Pathname.new(Dir.pwd).join('public', 'exchange_rates.json').to_s
logger.info("cache: ")
logger.info(moe.cache)
moe.ttl_in_seconds = 3600

#moe.secure_connection = true
#moe.app_id = '01f9f07f87ae417ab69f464d6b87ae26'

moe.update_rates
Money.default_bank = moe

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


currencies.each do |key,currency|
  Money::Currency.register(currency)
end

Money.use_i18n = false
