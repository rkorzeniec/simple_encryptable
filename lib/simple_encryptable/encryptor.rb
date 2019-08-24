# frozen_string_literal: true

require 'active_support/key_generator'
require 'active_support/message_encryptor'

module SimpleEncryptable
  class Encryptor
    class << self
      def encrypt(value, options)
        key = key(options)
        ActiveSupport::MessageEncryptor.new(key).encrypt_and_sign(value)
      end

      def decrypt(value, options)
        key = key(options)
        ActiveSupport::MessageEncryptor.new(key).decrypt_and_verify(value)
      end

      private

      def key(arguments = {})
        raise Error, 'Secret option is missing.' if arguments[:secret].to_s.empty?
        raise Error, 'Salt option is missing' if arguments[:salt].to_s.empty?

        ::ActiveSupport::KeyGenerator
          .new(arguments[:secret])
          .generate_key(arguments[:salt], ActiveSupport::MessageEncryptor.key_len).freeze
      end
    end
  end
end
