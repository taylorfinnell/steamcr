# # Generated from gc.proto
require "protobuf"

module GC
  enum GCProtoBufMsgSrc
    GCProtoBufMsgSrcUnspecified = 0
    GCProtoBufMsgSrcFromSystem  = 1
    GCProtoBufMsgSrcFromSteamID = 2
    GCProtoBufMsgSrcFromGC      = 3
    GCProtoBufMsgSrcReplySystem = 4
  end

  struct CMsgProtoBufHeader
    include Protobuf::Message

    contract_of "proto2" do
      optional :client_steam_id, :fixed64, 1
      optional :client_session_id, :int32, 2
      optional :source_app_id, :uint32, 3
      optional :job_id_source, :fixed64, 10, default: 18446744073709551615
      optional :job_id_target, :fixed64, 11, default: 18446744073709551615
      optional :target_job_name, :string, 12
      optional :eresult, :int32, 13, default: 2
      optional :error_message, :string, 14
      optional :ip, :uint32, 15
      optional :gc_msg_src, GCProtoBufMsgSrc, 200, default: GCProtoBufMsgSrc::GCProtoBufMsgSrcUnspecified
      optional :gc_dir_index_source, :uint32, 201
    end
  end
end
