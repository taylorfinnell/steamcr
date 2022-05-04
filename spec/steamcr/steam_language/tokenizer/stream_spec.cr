require "../../../spec_helper"

module Steamcr::SteamLanguage::Tokenizer
  describe Stream do
    describe "current" do
      it "returns nil if at eof" do
        stream = Stream.new(IO::Memory.new)

        stream.current.should be_nil
      end

      it "returns the current character" do
        stream = Stream.new(IO::Memory.new("blah"))

        stream.current.should eq "b"
      end
    end

    describe "consume" do
      it "returns the consumed char" do
        stream = Stream.new(IO::Memory.new("blah"))
        stream.consume.should eq("b")
      end

      it "advances the buffer" do
        stream = Stream.new(IO::Memory.new("blah"))
        stream.consume

        stream.current.should eq "l"
      end
    end

    describe "eof?" do
      it "returns true if at eof" do
        stream = Stream.new(IO::Memory.new("b"))
        stream.consume

        stream.eof?.should eq true
      end

      it "returns false if not at eof" do
        stream = Stream.new(IO::Memory.new("b"))

        stream.eof?.should eq false
      end
    end

    describe "snapshot" do
      it "adds to snapshot list" do
        stream = Stream.new(IO::Memory.new)
        stream.snapshot

        stream.snapshots.size.should eq(1)
      end
    end

    describe "peek" do
      it "returns nil if no next char" do
        stream = Stream.new(IO::Memory.new)

        stream.peek.should be_nil
      end

      it "returns the next char" do
        stream = Stream.new(IO::Memory.new("blah"))

        stream.peek.should eq "l"
      end
    end

    describe "rollback" do
      it "returns new index" do
        stream = Stream.new(IO::Memory.new("blah"))
        stream.snapshot
        2.times { stream.consume }

        stream.rollback.should eq(0)
      end
    end

    describe "snapshots" do
      it "can snapshot and rollback" do
        stream = Stream.new(IO::Memory.new("blah"))

        stream.consume # advance to l
        stream.snapshot
        2.times { stream.consume } # la
        stream.rollback

        stream.current.should eq "l"
      end
    end

    describe "commit" do
      it "commits the snapshot" do
        stream = Stream.new(IO::Memory.new("blah"))

        stream.consume # advance to l
        stream.snapshot
        2.times { stream.consume } # la
        stream.commit

        stream.current.should eq "h"
      end
    end
  end
end
