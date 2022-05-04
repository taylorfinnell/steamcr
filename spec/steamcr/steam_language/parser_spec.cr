require "../../spec_helper"

module Steamcr::SteamLanguage
  describe Parser do
    describe "parsing classes" do
      it "handles no var vals" do
        parser = Parser.new(
          IO::Memory.new(<<-EOF
            class Test {
              int x;
            };
          EOF
          ))

        parser.parse

        parser.classes.should eq([
          Parser::ClassNode.new("Test", nil, [
            Parser::DefinitionNode.new(
              name: "x",
              type: "int"
            ),
          ]),
        ])
      end

      it "translate ulong.MaxValue" do
        parser = Parser.new(
          IO::Memory.new(<<-EOF
            class Test {
              int x = ulong.MaxValue;
            };
          EOF
          ))

        parser.parse

        parser.classes.should eq([
          Parser::ClassNode.new("Test", nil, [
            Parser::DefinitionNode.new(
              name: "x",
              value: "0xFFFFFFFFFFFFFFFF",
              type: "int"
            ),
          ]),
        ])
      end

      it "is reasonable with a value" do
        parser = Parser.new(
          IO::Memory.new(<<-EOF
            class Test {
              protomask EMsg msg = EMsg::Invalid;
            };
          EOF
          ))

        parser.parse

        parser.classes.should eq([
          Parser::ClassNode.new("Test", nil, [
            Parser::DefinitionNode.new(
              name: "msg",
              value: "EMsg::Invalid",
              type: "EMsg",
              flags: "protomask"
            ),
          ]),
        ])
      end

      it "is reasonable typed classes with flags" do
        parser = Parser.new(
          IO::Memory.new(<<-EOF
            class Test {
              proto<headerLength> SteamKit2.Internal.CMsgProtoBufHeader proto;
              byte<20> test;
            };
          EOF
          ))

        parser.parse

        parser.classes.should eq([
          Parser::ClassNode.new("Test", nil, [
            Parser::DefinitionNode.new(
              name: "proto",
              type: "SteamKit2.Internal.CMsgProtoBufHeader",
              flags: "proto",
              flag_opts: "headerLength"
            ),
            Parser::DefinitionNode.new(
              name: "test",
              type: "byte",
              flag_opts: "20"
            ),
          ]),
        ])
      end

      it "is reasonable typed classes" do
        parser = Parser.new(
          IO::Memory.new(<<-EOF
            class Test<uint> {
              ulong blah = 1;
            };
          EOF
          ))

        parser.parse

        parser.classes.should eq([
          Parser::ClassNode.new("Test", "uint", [
            Parser::DefinitionNode.new(
              name: "blah",
              value: "1",
              type: "ulong"
            ),
          ]),
        ])
      end

      it "is reasonable for classes" do
        parser = Parser.new(
          IO::Memory.new(<<-EOF
            class Test {
              ulong blah = 1;
            };
          EOF
          ))

        parser.parse

        parser.classes.should eq([
          Parser::ClassNode.new("Test", nil, [
            Parser::DefinitionNode.new(
              name: "blah",
              value: "1",
              type: "ulong"
            ),
          ]),
        ])
      end
    end

    it "is reasonable for enums" do
      parser = Parser.new(
        IO::Memory.new(<<-EOF
          enum Test {
            X = 0x1;
            Y = 2; removed "reason"
            Z = X | Y;
          };
        EOF
        ))

      parser.parse

      parser.enums.should eq([
        Parser::EnumNode.new("Test", nil, nil, [
          Parser::DefinitionNode.new(
            name: "X",
            value: "1"
          ),
          Parser::DefinitionNode.new(
            name: "Y",
            value: "2",
            obsolete: true,
            reason: "reason"
          ),
          Parser::DefinitionNode.new(
            name: "Z",
            value: "X | Y"
          ),
        ]),
      ])
    end

    it "parses proto hdr" do
      parser = Parser.new(
        IO::Memory.new(<<-EOF
          class MsgHdrProtoBuf
          {
              protomask EMsg msg = EMsg::Invalid;
              int headerLength;
          
              proto<headerLength> SteamKit2.Internal.CMsgProtoBufHeader proto;
          };
       EOF
        ))
      parser.parse
      puts parser.classes
    end
  end
end
