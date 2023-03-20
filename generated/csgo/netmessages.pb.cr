## Generated from netmessages.proto
require "protobuf"

module Csgo
  enum NET_Messages
    NetNOP = 0
    NetDisconnect = 1
    NetFile = 2
    NetSplitScreenUser = 3
    NetTick = 4
    NetStringCmd = 5
    NetSetConVar = 6
    NetSignonState = 7
    NetPlayerAvatarData = 100
  end
  enum CLC_Messages
    ClcClientInfo = 8
    ClcMove = 9
    ClcVoiceData = 10
    ClcBaselineAck = 11
    ClcListenEvents = 12
    ClcRespondCvarValue = 13
    ClcFileCRCCheck = 14
    ClcLoadingProgress = 15
    ClcSplitPlayerConnect = 16
    ClcClientMessage = 17
    ClcCmdKeyValues = 18
    ClcHltvReplay = 20
  end
  enum VoiceDataFormat_t
    VOICEDATAFORMATSTEAM = 0
    VOICEDATAFORMATENGINE = 1
  end
  enum ESplitScreenMessageType
    MSGSPLITSCREENADDUSER = 0
    MSGSPLITSCREENREMOVEUSER = 1
    MSGSPLITSCREENTYPEBITS = 1
  end
  enum SVC_Messages
    SvcServerInfo = 8
    SvcSendTable = 9
    SvcClassInfo = 10
    SvcSetPause = 11
    SvcCreateStringTable = 12
    SvcUpdateStringTable = 13
    SvcVoiceInit = 14
    SvcVoiceData = 15
    SvcPrint = 16
    SvcSounds = 17
    SvcSetView = 18
    SvcFixAngle = 19
    SvcCrosshairAngle = 20
    SvcBSPDecal = 21
    SvcSplitScreen = 22
    SvcUserMessage = 23
    SvcEntityMessage = 24
    SvcGameEvent = 25
    SvcPacketEntities = 26
    SvcTempEntities = 27
    SvcPrefetch = 28
    SvcMenu = 29
    SvcGameEventList = 30
    SvcGetCvarValue = 31
    SvcPaintmapData = 33
    SvcCmdKeyValues = 34
    SvcEncryptedData = 35
    SvcHltvReplay = 36
    SvcBroadcastCommand = 38
  end
  enum ReplayEventType_t
    REPLAYEVENTCANCEL = 0
    REPLAYEVENTDEATH = 1
    REPLAYEVENTGENERIC = 2
    REPLAYEVENTSTUCKNEEDFULLUPDATE = 3
  end
  
  struct CMsgVector
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :x, :float, 1
      optional :y, :float, 2
      optional :z, :float, 3
    end
  end
  
  struct CMsgVector2D
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :x, :float, 1
      optional :y, :float, 2
    end
  end
  
  struct CMsgQAngle
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :x, :float, 1
      optional :y, :float, 2
      optional :z, :float, 3
    end
  end
  
  struct CMsgRGBA
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :r, :int32, 1
      optional :g, :int32, 2
      optional :b, :int32, 3
      optional :a, :int32, 4
    end
  end
  
  struct CNETMsg_Tick
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :tick, :uint32, 1
      optional :host_computationtime, :uint32, 4
      optional :host_computationtime_std_deviation, :uint32, 5
      optional :host_framestarttime_std_deviation, :uint32, 6
      optional :hltv_replay_flags, :uint32, 7
    end
  end
  
  struct CNETMsg_StringCmd
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :command, :string, 1
    end
  end
  
  struct CNETMsg_SignonState
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :signon_state, :uint32, 1
      optional :spawn_count, :uint32, 2
      optional :num_server_players, :uint32, 3
      repeated :players_networkids, :string, 4
      optional :map_name, :string, 5
    end
  end
  
  struct CMsg_CVars
    include Protobuf::Message
    
    struct CVar
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :name, :string, 1
        optional :value, :string, 2
        optional :dictionary_name, :uint32, 3
      end
    end
    
    contract_of "proto2" do
      repeated :cvars, CMsgCVars::CVar, 1
    end
  end
  
  struct CNETMsg_SetConVar
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :convars, CMsgCVars, 1
    end
  end
  
  struct CNETMsg_NOP
    include Protobuf::Message
    
    contract_of "proto2" do
    end
  end
  
  struct CNETMsg_Disconnect
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :text, :string, 1
    end
  end
  
  struct CNETMsg_File
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :transfer_id, :int32, 1
      optional :file_name, :string, 2
      optional :is_replay_demo_file, :bool, 3
      optional :deny, :bool, 4
    end
  end
  
  struct CNETMsg_SplitScreenUser
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :slot, :int32, 1
    end
  end
  
  struct CNETMsg_PlayerAvatarData
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :accountid, :uint32, 1
      optional :rgb, :bytes, 2
    end
  end
  
  struct CCLCMsg_ClientInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :send_table_crc, :fixed32, 1
      optional :server_count, :uint32, 2
      optional :is_hltv, :bool, 3
      optional :is_replay, :bool, 4
      optional :friends_id, :uint32, 5
      optional :friends_name, :string, 6
      repeated :custom_files, :fixed32, 7
    end
  end
  
  struct CCLCMsg_Move
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :num_backup_commands, :uint32, 1
      optional :num_new_commands, :uint32, 2
      optional :data, :bytes, 3
    end
  end
  
  struct CCLCMsg_VoiceData
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :data, :bytes, 1
      optional :xuid, :fixed64, 2
      optional :format, VoiceDataFormatT, 3, default: VoiceDataFormatT::VOICEDATAFORMATENGINE
      optional :sequence_bytes, :int32, 4
      optional :section_number, :uint32, 5
      optional :uncompressed_sample_offset, :uint32, 6
    end
  end
  
  struct CCLCMsg_BaselineAck
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :baseline_tick, :int32, 1
      optional :baseline_nr, :int32, 2
    end
  end
  
  struct CCLCMsg_ListenEvents
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :event_mask, :fixed32, 1
    end
  end
  
  struct CCLCMsg_RespondCvarValue
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :cookie, :int32, 1
      optional :status_code, :int32, 2
      optional :name, :string, 3
      optional :value, :string, 4
    end
  end
  
  struct CCLCMsg_FileCRCCheck
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :code_path, :int32, 1
      optional :path, :string, 2
      optional :code_filename, :int32, 3
      optional :filename, :string, 4
      optional :file_fraction, :int32, 5
      optional :md5, :bytes, 6
      optional :crc, :uint32, 7
      optional :file_hash_type, :int32, 8
      optional :file_len, :int32, 9
      optional :pack_file_id, :int32, 10
      optional :pack_file_number, :int32, 11
    end
  end
  
  struct CCLCMsg_LoadingProgress
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :progress, :int32, 1
    end
  end
  
  struct CCLCMsg_SplitPlayerConnect
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :convars, CMsgCVars, 1
    end
  end
  
  struct CCLCMsg_CmdKeyValues
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :keyvalues, :bytes, 1
    end
  end
  
  struct CSVCMsg_ServerInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :protocol, :int32, 1
      optional :server_count, :int32, 2
      optional :is_dedicated, :bool, 3
      optional :is_official_valve_server, :bool, 4
      optional :is_hltv, :bool, 5
      optional :is_replay, :bool, 6
      optional :is_redirecting_to_proxy_relay, :bool, 21
      optional :c_os, :int32, 7
      optional :map_crc, :fixed32, 8
      optional :client_crc, :fixed32, 9
      optional :string_table_crc, :fixed32, 10
      optional :max_clients, :int32, 11
      optional :max_classes, :int32, 12
      optional :player_slot, :int32, 13
      optional :tick_interval, :float, 14
      optional :game_dir, :string, 15
      optional :map_name, :string, 16
      optional :map_group_name, :string, 17
      optional :sky_name, :string, 18
      optional :host_name, :string, 19
      optional :public_ip, :uint32, 20
      optional :ugc_map_id, :uint64, 22
    end
  end
  
  struct CSVCMsg_ClassInfo
    include Protobuf::Message
    
    struct class_t
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :class_id, :int32, 1
        optional :data_table_name, :string, 2
        optional :class_name, :string, 3
      end
    end
    
    contract_of "proto2" do
      optional :create_on_client, :bool, 1
      repeated :classes, CSVCMsgClassInfo::ClassT, 2
    end
  end
  
  struct CSVCMsg_SendTable
    include Protobuf::Message
    
    struct sendprop_t
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :type, :int32, 1
        optional :var_name, :string, 2
        optional :flags, :int32, 3
        optional :priority, :int32, 4
        optional :dt_name, :string, 5
        optional :num_elements, :int32, 6
        optional :low_value, :float, 7
        optional :high_value, :float, 8
        optional :num_bits, :int32, 9
      end
    end
    
    contract_of "proto2" do
      optional :is_end, :bool, 1
      optional :net_table_name, :string, 2
      optional :needs_decoder, :bool, 3
      repeated :props, CSVCMsgSendTable::SendpropT, 4
    end
  end
  
  struct CSVCMsg_Print
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :text, :string, 1
    end
  end
  
  struct CSVCMsg_SetPause
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :paused, :bool, 1
    end
  end
  
  struct CSVCMsg_SetView
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :entity_index, :int32, 1
    end
  end
  
  struct CSVCMsg_CreateStringTable
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :name, :string, 1
      optional :max_entries, :int32, 2
      optional :num_entries, :int32, 3
      optional :user_data_fixed_size, :bool, 4
      optional :user_data_size, :int32, 5
      optional :user_data_size_bits, :int32, 6
      optional :flags, :int32, 7
      optional :string_data, :bytes, 8
    end
  end
  
  struct CSVCMsg_UpdateStringTable
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :table_id, :int32, 1
      optional :num_changed_entries, :int32, 2
      optional :string_data, :bytes, 3
    end
  end
  
  struct CSVCMsg_VoiceInit
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :quality, :int32, 1
      optional :codec, :string, 2
      optional :version, :int32, 3, default: 0
    end
  end
  
  struct CSVCMsg_VoiceData
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :client, :int32, 1
      optional :proximity, :bool, 2
      optional :xuid, :fixed64, 3
      optional :audible_mask, :int32, 4
      optional :voice_data, :bytes, 5
      optional :caster, :bool, 6
      optional :format, VoiceDataFormatT, 7, default: VoiceDataFormatT::VOICEDATAFORMATENGINE
      optional :sequence_bytes, :int32, 8
      optional :section_number, :uint32, 9
      optional :uncompressed_sample_offset, :uint32, 10
    end
  end
  
  struct CSVCMsg_FixAngle
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :relative, :bool, 1
      optional :angle, CMsgQAngle, 2
    end
  end
  
  struct CSVCMsg_CrosshairAngle
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :angle, CMsgQAngle, 1
    end
  end
  
  struct CSVCMsg_Prefetch
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :sound_index, :int32, 1
    end
  end
  
  struct CSVCMsg_BSPDecal
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :pos, CMsgVector, 1
      optional :decal_texture_index, :int32, 2
      optional :entity_index, :int32, 3
      optional :model_index, :int32, 4
      optional :low_priority, :bool, 5
    end
  end
  
  struct CSVCMsg_SplitScreen
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :type, ESplitScreenMessageType, 1, default: ESplitScreenMessageType::MSGSPLITSCREENADDUSER
      optional :slot, :int32, 2
      optional :player_index, :int32, 3
    end
  end
  
  struct CSVCMsg_GetCvarValue
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :cookie, :int32, 1
      optional :cvar_name, :string, 2
    end
  end
  
  struct CSVCMsg_Menu
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :dialog_type, :int32, 1
      optional :menu_key_values, :bytes, 2
    end
  end
  
  struct CSVCMsg_UserMessage
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :msg_type, :int32, 1
      optional :msg_data, :bytes, 2
      optional :passthrough, :int32, 3
    end
  end
  
  struct CSVCMsg_PaintmapData
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :paintmap, :bytes, 1
    end
  end
  
  struct CSVCMsg_GameEvent
    include Protobuf::Message
    
    struct key_t
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :type, :int32, 1
        optional :val_string, :string, 2
        optional :val_float, :float, 3
        optional :val_long, :int32, 4
        optional :val_short, :int32, 5
        optional :val_byte, :int32, 6
        optional :val_bool, :bool, 7
        optional :val_uint64, :uint64, 8
        optional :val_wstring, :bytes, 9
      end
    end
    
    contract_of "proto2" do
      optional :event_name, :string, 1
      optional :eventid, :int32, 2
      repeated :keys, CSVCMsgGameEvent::KeyT, 3
      optional :passthrough, :int32, 4
    end
  end
  
  struct CSVCMsg_GameEventList
    include Protobuf::Message
    
    struct key_t
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :type, :int32, 1
        optional :name, :string, 2
      end
    end
    
    struct descriptor_t
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :eventid, :int32, 1
        optional :name, :string, 2
        repeated :keys, CSVCMsgGameEventList::KeyT, 3
      end
    end
    
    contract_of "proto2" do
      repeated :descriptors, CSVCMsgGameEventList::DescriptorT, 1
    end
  end
  
  struct CSVCMsg_TempEntities
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :reliable, :bool, 1
      optional :num_entries, :int32, 2
      optional :entity_data, :bytes, 3
    end
  end
  
  struct CSVCMsg_PacketEntities
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :max_entries, :int32, 1
      optional :updated_entries, :int32, 2
      optional :is_delta, :bool, 3
      optional :update_baseline, :bool, 4
      optional :baseline, :int32, 5
      optional :delta_from, :int32, 6
      optional :entity_data, :bytes, 7
    end
  end
  
  struct CSVCMsg_Sounds
    include Protobuf::Message
    
    struct sounddata_t
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :origin_x, :sint32, 1
        optional :origin_y, :sint32, 2
        optional :origin_z, :sint32, 3
        optional :volume, :uint32, 4
        optional :delay_value, :float, 5
        optional :sequence_number, :int32, 6
        optional :entity_index, :int32, 7
        optional :channel, :int32, 8
        optional :pitch, :int32, 9
        optional :flags, :int32, 10
        optional :sound_num, :uint32, 11
        optional :sound_num_handle, :fixed32, 12
        optional :speaker_entity, :int32, 13
        optional :random_seed, :int32, 14
        optional :sound_level, :int32, 15
        optional :is_sentence, :bool, 16
        optional :is_ambient, :bool, 17
      end
    end
    
    contract_of "proto2" do
      optional :reliable_sound, :bool, 1
      repeated :sounds, CSVCMsgSounds::SounddataT, 2
    end
  end
  
  struct CSVCMsg_EntityMsg
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :ent_index, :int32, 1
      optional :class_id, :int32, 2
      optional :ent_data, :bytes, 3
    end
  end
  
  struct CSVCMsg_CmdKeyValues
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :keyvalues, :bytes, 1
    end
  end
  
  struct CSVCMsg_EncryptedData
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :encrypted, :bytes, 1
      optional :key_type, :int32, 2
    end
  end
  
  struct CSVCMsg_HltvReplay
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :delay, :int32, 1
      optional :primary_target, :int32, 2
      optional :replay_stop_at, :int32, 3
      optional :replay_start_at, :int32, 4
      optional :replay_slowdown_begin, :int32, 5
      optional :replay_slowdown_end, :int32, 6
      optional :replay_slowdown_rate, :float, 7
    end
  end
  
  struct CCLCMsg_HltvReplay
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :request, :int32, 1
      optional :slowdown_length, :float, 2
      optional :slowdown_rate, :float, 3
      optional :primary_target_ent_index, :int32, 4
      optional :event_time, :float, 5
    end
  end
  
  struct CSVCMsg_Broadcast_Command
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :cmd, :string, 1
    end
  end
  end
