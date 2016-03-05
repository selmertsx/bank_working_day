# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bank_working_day/version'

Gem::Specification.new do |spec|
  spec.name          = "bank_working_day"
  spec.version       = BankWorkingDay::VERSION
  spec.authors       = ["Morioka Shuhei"]
  spec.email         = ["selmertsx@gmail.com"]

  spec.summary       = %q{銀行の口座振替日、振込日をよしなに取得してくれるgem}
  spec.description   = %q{銀行の営業日計算を行う}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'activesupport'
end
