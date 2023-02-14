require "../spec_helper"

module Steamcr
  describe "crypto" do
    it "works" do
      crypto = Crypto.new
      _, key = crypto.generate_key

      str = "A" * 1024

      x = crypto.encrypt(str.to_slice, key)
      y = crypto.decrypt(x.to_slice, key)
      y.should eq(IO::Memory.new(str).to_slice)
    end
  end
end
