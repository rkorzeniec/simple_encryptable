lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_encryptable/version'

Gem::Specification.new do |spec|
  spec.name = 'simple_encryptable'
  spec.version = SimpleEncryptable::VERSION
  spec.authors = ['Robert Korzeniec']
  spec.email = ['r.korzeniec@gmail.com']

  spec.summary = 'Simple encryption service, without all the extras'
  spec.description = 'This simple enrtyption service was heavily inspired by https://pawelurbanek.com/rails-secure-encrypt-decrypt'

  spec.license = 'MIT'
  spec.homepage = 'https://github.com/rkorzeniec/simple_encryptable/'
  spec.metadata['source_code_uri'] = 'https://github.com/rkorzeniec/simple_encryptable'
  spec.metadata['changelog_uri'] = 'https://github.com/rkorzeniec/simple_encryptable/CHANGELOG.md'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4'

  spec.add_dependency 'activesupport', '>= 4.2'

  spec.add_development_dependency 'bundler', '~> 2.2.12'
  spec.add_development_dependency 'minitest', '~> 5.14.0'
  spec.add_development_dependency 'minitest-profile', '~> 0.0.2'
  spec.add_development_dependency 'minitest-reporters', '~> 1.4.2'
  spec.add_development_dependency 'rake', '~> 13.0'
end
