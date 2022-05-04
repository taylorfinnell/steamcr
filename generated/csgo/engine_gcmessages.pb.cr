# # Generated from engine_gcmessages.proto
require "protobuf"

module Csgo
  struct CEngineGotvSyncPacket
    include Protobuf::Message

    contract_of "proto2" do
      optional :match_id, :uint64, 1
      optional :instance_id, :uint32, 2
      optional :signupfragment, :uint32, 3
      optional :currentfragment, :uint32, 4
      optional :tickrate, :float, 5
      optional :tick, :uint32, 6
      optional :rtdelay, :float, 8
      optional :rcvage, :float, 9
      optional :keyframe_interval, :float, 10
      optional :cdndelay, :uint32, 11
    end
  end
end
