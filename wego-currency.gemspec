

Gem::Specification.new do |spec|
  spec.name          = "wego-currency"
  spec.version       = "0.1.0"
  spec.authors       = ["Wego Geeks"]
  spec.email         = ["therealgeeks@wego.com"]
  spec.summary       = %q{Wego Currency}
  spec.description   = %q{Wego Currency}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'rails', '>= 5.0.0'

  spec.add_dependency 'money'
  spec.add_dependency 'monetize'
  spec.add_dependency 'wego-money-bank'
end
