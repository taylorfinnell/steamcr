require "../../../spec_helper"

class Child
end

class MyNode
  include Steamcr::SteamLanguage::Parser::Node(Child)
end

module Steamcr::SteamLanguage
  describe Parser::Node do
    it "is enumerable" do
      node = MyNode.new

      node.to_a.should eq([] of Child)
    end

    it "can access children" do
      node = MyNode.new

      node.children
    end

    it "can add children" do
      node = MyNode.new
      node << Child.new

      node.size.should eq(1)
    end
  end
end
