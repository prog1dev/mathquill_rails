# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mathquill_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'mathquill_rails'
  spec.version       = MathquillRails::VERSION
  spec.authors       = ['ivan.filenko']
  spec.email         = ['ivan.filenko@protonmail.com']

  spec.summary       = 'no summary yet'
  spec.description   = 'no description yet'
  spec.homepage      = 'https://github.com/prog1dev/mathquill_rails'
  spec.license       = 'MIT'
  spec.files         = Dir['lib/**/*.{rb,erb}']
  spec.files        += Dir['app/**/*']
  spec.files        += Dir['*.md']
  spec.files        += ['LICENSE.txt']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
end
