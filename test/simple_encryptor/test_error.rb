require 'test_helper'

describe SimpleEncryptable do
  it { assert_includes(SimpleEncryptable::Error.ancestors, StandardError) }
end
