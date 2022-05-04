module Steamcr::SteamLanguage
  module Generator
    class CrystalGenerator
      include AbstractGenerator

      def format(code : String)
        Crystal.format(code)
      end

      def emit_ns(ns, &block)
        String.build do |str|
          str << "module #{ns}\n"
          str << indent { yield }
          str << "\n"
          str << "end\n"
        end
      end

      def emit_prelude
      end

      def emit_import(node : Parser::ImportNode)
        "require \"./#{node.name}\"\n"
      end

      def emit_class(node : Parser::ClassNode)
        class_code = String.build do |str|
          str << "class #{node.name}\n"

          variables_that_control_size_of_other_variables = node.children.select { |child| child.flags == "proto" && child.flag_opts != nil }.map { |c| c.flag_opts.not_nil! }

          node.children.each do |child|
            if child.flags == "const"
              str << indent { "#{child.name.underscore.upcase} = #{child.value}#{type_map_tiny(child.type)}" }
            else
              if variables_that_control_size_of_other_variables.includes?(child.name)
                str << indent { "@#{child.name.underscore} : #{type_map(child.type)}?" }
              else
                str << indent { "@#{child.name.underscore} : #{type_map(child.type)}" }
              end
            end
            str << "\n"
          end

          str << "\n"

          node.children.each do |child|
            if child.flags != "const"
              str << indent { "property #{child.name.underscore}" }
            end
            str << "\n"
          end

          str << "\n"

          contructor_params = node.children.map do |child|
            if !child.value
              if child.flags == "proto"
                "@#{child.name.underscore} : #{type_map(child.type)} = #{type_map(child.type)}.new"
              else
                if variables_that_control_size_of_other_variables.includes?(child.name)
                  "@#{child.name.underscore} : #{type_map(child.type)}? = nil"
                else
                  "@#{child.name.underscore} : #{type_map(child.type)}"
                end
              end
            end
          end.compact

          initialized_vars = node.children.map do |child|
            if child.value && child.flags != "const"
              if child.value.not_nil!.includes?("::")
                klass, value = child.value.to_s.split("::")
                value = [klass, value.upcase].join("::")
                indent(2) { "@#{child.name.underscore} = #{value}" }
              else
                indent(2) { "@#{child.name.underscore} = #{child.value}" }
              end
            end
          end.compact

          str << indent { "def initialize(#{contructor_params.join(", ")})\n" }
          str << "#{initialized_vars.join("\n")}\n"
          str << indent { "end\n" }

          str << indent { "def deserialize(io : IO::Memory)\n" }
          node.children.each do |child|
            if child.flags != "const" # don't deser constants
              if child.flags == "proto"
                str << indent { <<-PROTO
                  tmp = Bytes.new(@#{child.flag_opts.not_nil!.underscore}.not_nil!)\n
                  io.read_fully(tmp)
                  @proto = typeof(@proto).from_protobuf(IO::Memory.new(tmp))
                PROTO
 }
              else
                if child.flags == "protomask"
                  str << "@#{child.name.underscore} = EMsg.new(io.read_bytes(Int32) & ~0x80000000)\n"
                elsif child.flags == "protomaskgc"
                  str << "@#{child.name.underscore} = io.read_bytes(UInt32) & ~0x80000000\n"
                else
                  str << "@#{child.name.underscore} = io.read_bytes(#{type_map(child.type)})\n"
                end
              end
            end
          end
          str << indent { "end\n" }

          str << indent { "def serialize(io : IO::Memory)" }

          node.children.each do |child|
            if child.flags != "const" # don't deser constants
              if child.flags == "proto"
                str << indent { <<-PROTO
                  tmp  = IO::Memory.new
                  @proto.not_nil!.to_protobuf(tmp)
                  tmpb = tmp.to_slice
                  @#{child.flag_opts.not_nil!.underscore} = tmpb.size
                  io.write_bytes(@#{child.flag_opts.not_nil!.underscore}.not_nil!)
                  io.write(tmpb)

                PROTO
 }
              else
                if !variables_that_control_size_of_other_variables.includes?(child.name)
                  if child.flags == "protomask"
                    str << "io.write_bytes(#{child.type}.new(@#{child.name.underscore}.value | 0x80000000))\n"
                  elsif child.flags == "protomaskgc"
                    str << "io.write_bytes(@#{child.name.underscore} | 0x80000000)\n"
                  else
                    str << "io.write_bytes(@#{child.name.underscore})\n"
                  end
                end
              end
            end
          end

          str << indent { "end\n" }

          str << "end"
          str << "\n"
        end

        emit_ns("Steamcr") { class_code }
      end

      def emit_enum(node : Parser::EnumNode)
        type = type_map(node.type)

        code = String.build do |str|
          if type
            str << "enum #{node.name} : #{type}\n"
          else
            str << "enum #{node.name}\n"
          end

          if type
            from_io = <<-FROM_IO
            def self.from_io(io, format)
              #{node.name}.new(io.read_bytes(#{type_map(type)}))
            end

            def to_io(io, format)
              format.encode(self.value, io)
            end

            FROM_IO
            str << from_io
          else
            from_io = <<-FROM_IO
            def self.from_io(io, format)
              #{node.name}.new(io.read_bytes(Int32))
            end

            def to_io(io, format)
              format.encode(self.value, io)
            end

            FROM_IO
            str << from_io
          end

          node.children.each do |child|
            str << indent do
              s = "#{child.obsolete ? "# " : ""} #{child.name.underscore.upcase} = #{child.value.to_s.underscore.upcase}"
            end
            str << " # deprecated " if child.obsolete
            str << "(#{child.reason})" if child.obsolete && child.reason
            str << "\n"
          end

          str << "end"
          str << "\n\n"
        end

        emit_ns("Steamcr") { code }
      end

      private def type_map(type)
        case type
        when "uint"
          "UInt32"
        when "byte"
          "UInt8"
        when "ulong"
          "UInt64"
        when "ushort"
          "UInt16"
        when "int"
          "Int32"
        when nil
          nil
        when "SteamKit2.GC.Internal.CMsgProtoBufHeader"
          "GC::CMsgProtoBufHeader"
        when "SteamKit2.Internal.CMsgProtoBufHeader"
          "Steam::CMsgProtoBufHeader"
        else
          type
        end
      end

      private def type_map_tiny(type)
        case type
        when "uint"
          "u32"
        when "byte"
          "u8"
        when "ulong"
          "u64"
        when "ushort"
          "u16"
        when "int"
          "i32"
        when nil
          nil
        else
          raise Exception.new("SHIT #{type}")
        end
      end
    end
  end
end
