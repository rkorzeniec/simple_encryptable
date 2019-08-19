require 'test_helper'

describe SimpleEncryptor::Encryptor do
  describe '.encrypt' do
    let(:encrypted_value) do
      SimpleEncryptor::Encryptor.encrypt('foo', secret: 'bar', salt: 'baz')
    end

    it { refute_equal('foo', encrypted_value) }
    it { refute_nil(encrypted_value) }

    it { assert_kind_of(String, encrypted_value) }
    it { assert_equal(110, encrypted_value.length) }
  end

  describe '.decrypt' do
    it do
      value = SimpleEncryptor::Encryptor.encrypt('foo', secret: 'bar', salt: 'baz')

      assert_equal(
        'foo',
        SimpleEncryptor::Encryptor.decrypt(value, secret: 'bar', salt: 'baz')
      )
    end
  end
end
