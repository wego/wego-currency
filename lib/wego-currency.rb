require 'rails'
require 'active_model'
require 'monetize'

module WegoCurrency
  def self.root
    Rails.try(:root) || File.dirname(__dir__)
  end

  def self.bin
    File.join root, 'bin'
  end

  def self.lib
    File.join root, 'lib'
  end

  def self.config
    File.join root, 'config'
  end
end

Gem.find_files("#{WegoCurrency.lib}/wego-currency/**/*.rb").each { |path| require path }
Gem.find_files("#{WegoCurrency.config}/**/*.rb").each { |path| require path }
