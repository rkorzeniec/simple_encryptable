# frozen_string_literal: true

require 'active_support/concern'
require 'simple_encryptor/error'
require 'simple_encryptor/encryptor'
require 'simple_encryptor/version'

module SimpleEncryptor
  extend ActiveSupport::Concern

  class_methods do
    def attr_encryptable(*attributes)
      options = attributes.last.is_a?(Hash) ? attributes.pop : {}
      attributes.each do |attribute|
        define_method("#{attribute}=".to_sym) do |value|
          return if value.nil?

          public_send(
            "encrypted_#{attribute}=".to_sym,
            Encryptor.encrypt(value, options)
          )
        end

        define_method(attribute) do
          value = public_send("encrypted_#{attribute}".to_sym)
          Encryptor.decrypt(value, options) if value.present?
        end

        define_method("#{attribute}?".to_sym) do
          value = send(attribute)
          value.respond_to?(:empty?) ? !value.empty? : !!value
        end
      end
    end
  end
end
