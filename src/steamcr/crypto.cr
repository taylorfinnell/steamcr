require "openssl_ext"
require "digest/crc32"
require "openssl/cipher"

module Steamcr
  class Crypto
    KEY = <<-KEY
    -----BEGIN PUBLIC KEY-----
    MIGdMA0GCSqGSIb3DQEBAQUAA4GLADCBhwKBgQDf7BrWLBBmLBc1OhSwfFkRf53T
    2Ct64+AVzRkeRuh7h3SiGEYxqQMUeYKO6UWiSRKpI2hzic9pobFhRr3Bvr/WARvY
    gdTckPv+T1JzZsuVcNfFjrocejN1oWI0Rrtgt4Bo+hOneoo3S57G9F1fOpn5nsQ6
    6WOiu4gZKODnFMBCiQIBEQ==
    -----END PUBLIC KEY-----
    KEY

    def generate_key
      key = OpenSSL::PKey::RSA.new(KEY)
      plain = Random.new.random_bytes(32)

      [key.public_encrypt(plain, LibCrypto::Padding::PKCS1_OAEP_PADDING), plain]
    end

    def session_key_crc(key)
      Digest::CRC32.checksum(key)
    end

    def encrypt(io : Bytes, key)
      iv = Random.new.random_bytes(16)

      iv_cipher = iv_cipher(key, "encrypt")
      cipher = data_cipher(key, iv, "encrypt")

      r = IO::Memory.new
      r.write(iv_cipher.update(iv))
      r.write(iv_cipher.final)
      r.write(cipher.update(io))
      r.write(cipher.final)

      r.rewind

      r.to_slice
    end

    def decrypt(io : Bytes, key)
      iv_cipher = iv_cipher(key, "decrypt")
      crypted_iv = io[0, 16]

      iv = IO::Memory.new
      iv.write(iv_cipher.update(crypted_iv))
      iv.write(iv_cipher.final)
      iv.rewind
      iv = iv.to_slice

      cipher = data_cipher(key, iv, "decrypt")

      r = IO::Memory.new
      r.write(cipher.update(io[16..]))
      r.write(cipher.final)
      r.rewind
      r.to_slice
    end

    private def data_cipher(key, iv, type)
      cipher = OpenSSL::Cipher.new("aes-256-cbc")
      if type == "encrypt"
        cipher.encrypt
      else
        cipher.decrypt
      end
      cipher.key = key
      cipher.iv = iv
      cipher
    end

    private def iv_cipher(key, type)
      iv_cipher = OpenSSL::Cipher.new("aes-256-ecb")
      if type == "encrypt"
        iv_cipher.encrypt
      else
        iv_cipher.decrypt
      end
      iv_cipher.key = key
      iv_cipher.padding = false
      iv_cipher
    end
  end
end
