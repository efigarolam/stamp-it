# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stamp_it'

Gem::Specification.new do |spec|
  spec.name          = 'stamp-it'
  spec.version       = StampIt::VERSION
  spec.authors       = ['Eduardo Figarola']
  spec.email         = 'eduardofigarola@gmail.com'
  spec.summary       = 'Add watermarks to existing PDF files'
  spec.homepage      = 'https://github.com/efigarolam/stamp-it'
  spec.license       = 'GPL'
  spec.date          = Time.now.strftime('%Y-%m-%d')

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails'
  spec.add_dependency 'prawn'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.description    = 'Add watermarks to existing PDF files, the easy way.'
end
