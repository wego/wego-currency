# WegoCurrency

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wego-currency'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wego-currency

## Usage

We are getting the rates from [gem `wego-money-bank`](https://github.com/wego/wego-money-bank)

<b>Converting Currencies:</b>

`WegoCurrency::Client.convert_amount(amount, currency_code, new_currency_code)`

<b>Converting Currencies with `usd` as base currency:</b>

`WegoCurrency::Client.convert_amount_usd(amount_usd, new_currency_code)`

This method is a wrapper method of the above with `usd` as a base to convert into new currency code.

<b>To check for all valid currencies: </b>

`WegoCurrency::Client.all_currencies`
returns an array of currency code.
`example: [:sgd,:usd,:clp,:crc]`

<b> To check if currency code is valid </b>

`WegoCurrency::Client.is_currency_code_valid?(currency_code)`

Accepts uppercase or lower case string / symbol.
returns boolean

```
> WegoCurrency::Client.is_currency_code_valid?("sgd")
=> true
> WegoCurrency::Client.is_currency_code_valid?("abc")
=> false
```

## Contributing

1.  Fork it ( https://github.com/[my-github-username]/wego-currency/fork )
2.  Create your feature branch (`git checkout -b my-new-feature`)
3.  Commit your changes (`git commit -am 'Add some feature'`)
4.  Push to the branch (`git push origin my-new-feature`)
5.  Create a new Pull Request
