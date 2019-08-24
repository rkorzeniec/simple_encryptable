require 'test_helper'

class User
  include SimpleEncryptor

  attr_accessor :encrypted_email, :encrypted_password, :encrypted_token

  attr_encryptable :email, secret: 'foo', salt: 'bar'
  attr_encryptable :password, :token, secret: 'baz', salt: 'zab'
  attr_encryptable :aux

  def initialize(email: nil, password: nil, token: nil, aux: nil)
    self.email = email
    self.password = password
    self.token = token
    self.aux = aux
  end
end


describe SimpleEncryptor do
  describe '.attr_encryptable' do
    let(:user) { User.new(email: 'john@example.com') }

    it 'defines writer' do
      assert(user.respond_to?(:email=))
    end

    it 'defines reader' do
      assert(user.respond_to?(:email))
    end

    it 'defines boolean method' do
      assert(user.respond_to?(:email?))
    end

    it 'encrypts email correctly' do
      decrypted_email = SimpleEncryptor::Encryptor.decrypt(
        user.encrypted_email, secret: 'foo', salt: 'bar'
      )

      assert_equal('john@example.com', decrypted_email)
    end

    it 'encrypted does not equal email' do
      refute_equal('john@example.com', user.encrypted_email)
    end

    it 'encrypts as string' do
      assert_kind_of(String, user.encrypted_email)
    end

    it 'encrypts always with same length' do
      assert_equal(138, user.encrypted_email.size)
    end

    it 'decrypts correctly' do
      assert_equal('john@example.com', user.email)
    end

    it 'encrypted when value set' do
      assert(user.email?)
    end

    it 'encrypted when value set' do
      user = User.new
      refute(user.email?)
    end

    it 'handles multiple encriptions' do
      user = User.new(password: 'password', token: 'secret')
      assert(user.password?)
      assert_equal('password', user.password)
      assert(user.token?)
      assert_equal('secret', user.token)
    end

    it do
      exception = assert_raises(SimpleEncryptor::Error) do
        User.new(aux: 'secret')
      end
      assert_equal('Secret option is missing.', exception.message)
    end
  end
end
