require 'test_helper'

describe SimpleEncryptable::Encryptor do
  describe '.encrypt' do
    let(:encrypted_value) do
      SimpleEncryptable::Encryptor.encrypt('foo', secret: 'bar', salt: 'baz')
    end

    it { refute_equal('foo', encrypted_value) }
    it { refute_nil(encrypted_value) }

    it { assert_kind_of(String, encrypted_value) }
    it { assert_equal(110, encrypted_value.length) }

    it do
      exception = assert_raises(SimpleEncryptable::Error) do
        SimpleEncryptable::Encryptor.encrypt('foo', {})
      end
      assert_equal('Secret option is missing.', exception.message)
    end
  end

  describe '.decrypt' do
    it do
      value = SimpleEncryptable::Encryptor.encrypt('foo', secret: 'bar', salt: 'baz')

      assert_equal(
        'foo',
        SimpleEncryptable::Encryptor.decrypt(value, secret: 'bar', salt: 'baz')
      )
    end

    it do
      exception = assert_raises(SimpleEncryptable::Error) do
        SimpleEncryptable::Encryptor.decrypt('foo', {})
      end
      assert_equal('Secret option is missing.', exception.message)
    end
  end
end
