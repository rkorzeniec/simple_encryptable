$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'simple_encryptable'

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/profile'

Minitest::Reporters.use!
