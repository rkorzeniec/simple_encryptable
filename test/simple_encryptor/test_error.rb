require 'test_helper'

describe SimpleEncryptor do
  it { assert_includes(SimpleEncryptor::Error.ancestors, StandardError) }
end
