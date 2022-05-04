module Steamcr::SteamLanguage::Tokenizer
  class Snapshot
    getter index

    def initialize(@index : Int32)
    end
  end

  class Snapshots
    include Enumerable(Snapshot)

    def initialize
      @snapshots = [] of Snapshot
    end

    def add(snapshot)
      @snapshots << snapshot
    end

    def each
      @snapshots.each do |s|
        yield s
      end
    end

    def rollback
      snapshot = pop
      snapshot.index
    end

    def commit
      pop
    end

    private def pop
      @snapshots.pop(1)[0]
    end
  end

  class Stream
    @index : Int32
    @items : Array(String)

    getter index
    getter snapshots

    @snapshots : Snapshots

    def initialize(@io : IO)
      @index = 0
      @items = @io.gets_to_end.gsub(/\/\/.*/, "").chars.map(&.to_s)
      @snapshots = Snapshots.new
    end

    def current : String?
      return nil if eof?
      @items[@index]
    end

    def consume
      current.tap { @index += 1 }
    end

    def eof?
      @index >= @items.size
    end

    def peek
      if @index + 1 < @items.size
        @items[@index + 1]
      else
        nil
      end
    end

    def snapshot
      @snapshots.add(Snapshot.new(@index))
    end

    def rollback
      @index = @snapshots.rollback
    end

    def commit
      @snapshots.commit
    end
  end
end
