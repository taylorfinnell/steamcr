require "../../spec_helper"

module Steamcr::SteamLanguage
  describe Token do
    describe "equality" do
      it "is equal if type and value are same" do
        token = Token.new(TokenType::EOF, "val")
        token2 = Token.new(TokenType::EOF, "val")

        (token == token2).should be_true
      end

      it "is not equal if value is different" do
        token = Token.new(TokenType::EOF, "val")
        token2 = Token.new(TokenType::EOF, "val2")

        (token == token2).should be_false
      end

      it "is not equal if type is differnt" do
        token = Token.new(TokenType::CLASS, "val")
        token2 = Token.new(TokenType::EOF, "val")

        (token == token2).should be_false
      end

      it "is not equal if type and value are different" do
        token = Token.new(TokenType::CLASS, "val2")
        token2 = Token.new(TokenType::EOF, "val")

        (token == token2).should be_false
      end
    end
  end
end
