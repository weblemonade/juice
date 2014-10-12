# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "juice"
  spec.version       = '0.0.3'
  spec.authors       = ["Kevin Wolff"]
  spec.email         = ["kevin.wolff@weblemonade.com"]
  spec.description   = %q{A rails engine for scaffolding, ui helpers, etc.}
  spec.summary       = %q{A rails engine for scaffolding, ui helpers, etc.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir.glob("{app,lib,config}/**/*")
  # spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  # environment
  spec.add_dependency "rails", "~> 4.1.0"

  # database
  # gem 'sqlite3', group: [:development, :test]
  spec.add_dependency 'pg'
  spec.add_dependency 'foreigner'

  # users, authorization and permissions
  spec.add_dependency 'cancan'
  spec.add_dependency 'devise'

  # dry efficient code
  # spec.add_dependency 'inherited_resources'
  spec.add_dependency 'slim-rails'

  # ui
  spec.add_dependency 'bootstrap-sass', '~> 3.0.3.0'
  spec.add_dependency 'font-awesome-rails'
  spec.add_dependency 'simple_form'
  # spec.add_dependency 'show_for'
  spec.add_dependency 'will_paginate-bootstrap'
  spec.add_dependency 'paperclip'

  spec.add_dependency 'smart_listing'

end
