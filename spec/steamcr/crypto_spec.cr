require "../spec_helper"

module Steamcr
  describe "crypto" do
    it "works" do
      crypto = Crypto.new
      _, key = crypto.generate_key

      str = "A" * 1024

      x = crypto.encrypt(IO::Memory.new(str), key)
      y = crypto.decrypt(IO::Memory.new(x), key)
      y.should eq(IO::Memory.new(str).to_slice)
    end
  end
end
