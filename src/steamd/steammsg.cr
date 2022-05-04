require "./header"
require "./gamecoordinator"

module Steamcr
  class MsgClientJustStrings
    def initialize
    end

    def deserialize(io : IO::Memory)
    end

    def serialize(io : IO::Memory)
    end
  end
end

module Steamcr
  class MsgClientGenericResponse
    @result : EResult

    property result

    def initialize(@result : EResult)
    end

    def deserialize(io : IO::Memory)
      @result = io.read_bytes(EResult)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@result)
    end
  end
end

module Steamcr
  class MsgChannelEncryptRequest
    PROTOCOL_VERSION = 1u32
    @protocol_version : UInt32
    @universe : EUniverse

    property protocol_version
    property universe

    def initialize
      @protocol_version = MsgChannelEncryptRequest::PROTOCOL_VERSION
      @universe = EUniverse::INVALID
    end

    def deserialize(io : IO::Memory)
      @protocol_version = io.read_bytes(UInt32)
      @universe = io.read_bytes(EUniverse)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@protocol_version)
      io.write_bytes(@universe)
    end
  end
end

module Steamcr
  class MsgChannelEncryptResponse
    @protocol_version : UInt32
    @key_size : UInt32

    property protocol_version
    property key_size

    def initialize
      @protocol_version = MsgChannelEncryptRequest::PROTOCOL_VERSION
      @key_size = 128
    end

    def deserialize(io : IO::Memory)
      @protocol_version = io.read_bytes(UInt32)
      @key_size = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@protocol_version)
      io.write_bytes(@key_size)
    end
  end
end

module Steamcr
  class MsgChannelEncryptResult
    @result : EResult

    property result

    def initialize
      @result = EResult::INVALID
    end

    def deserialize(io : IO::Memory)
      @result = io.read_bytes(EResult)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@result)
    end
  end
end

module Steamcr
  class MsgClientNewLoginKey
    def initialize
    end

    def deserialize(io : IO::Memory)
    end

    def serialize(io : IO::Memory)
    end
  end
end

module Steamcr
  class MsgClientNewLoginKeyAccepted
    def initialize
    end

    def deserialize(io : IO::Memory)
    end

    def serialize(io : IO::Memory)
    end
  end
end

module Steamcr
  class MsgClientLogon
    OBFUSCATION_MASK                                               = 3131961357u32
    CURRENT_PROTOCOL                                               =      65580u32
    PROTOCOL_VER_MAJOR_MASK                                        = 4294901760u32
    PROTOCOL_VER_MINOR_MASK                                        =      65535u32
    PROTOCOL_VER_MINOR_MIN_GAME_SERVERS                            =          4u16
    PROTOCOL_VER_MINOR_MIN_FOR_SUPPORTING_E_MSG_MULTI              =         12u16
    PROTOCOL_VER_MINOR_MIN_FOR_SUPPORTING_E_MSG_CLIENT_ENCRYPT_PCT =         14u16
    PROTOCOL_VER_MINOR_MIN_FOR_EXTENDED_MSG_HDR                    =         17u16
    PROTOCOL_VER_MINOR_MIN_FOR_CELL_ID                             =         18u16
    PROTOCOL_VER_MINOR_MIN_FOR_SESSION_ID_LAST                     =         19u16
    PROTOCOL_VER_MINOR_MIN_FOR_SERVER_AVAILABLITY_MSGS             =         24u16
    PROTOCOL_VER_MINOR_MIN_CLIENTS                                 =         25u16
    PROTOCOL_VER_MINOR_MIN_FOR_OS_TYPE                             =         26u16
    PROTOCOL_VER_MINOR_MIN_FOR_CEG_APPLY_PE_SIG                    =         27u16
    PROTOCOL_VER_MINOR_MIN_FOR_MARKETING_MESSAGES2                 =         27u16
    PROTOCOL_VER_MINOR_MIN_FOR_ANY_PROTO_BUF_MESSAGES              =         28u16
    PROTOCOL_VER_MINOR_MIN_FOR_PROTO_BUF_LOGGED_OFF_MESSAGE        =         28u16
    PROTOCOL_VER_MINOR_MIN_FOR_PROTO_BUF_MULTI_MESSAGES            =         28u16
    PROTOCOL_VER_MINOR_MIN_FOR_SENDING_PROTOCOL_TO_UFS             =         30u16
    PROTOCOL_VER_MINOR_MIN_FOR_MACHINE_AUTH                        =         33u16
    PROTOCOL_VER_MINOR_MIN_FOR_SESSION_ID_LAST_ANON                =         36u16
    PROTOCOL_VER_MINOR_MIN_FOR_ENHANCED_APP_LIST                   =         40u16
    PROTOCOL_VER_MINOR_MIN_FOR_STEAM_GUARD_NOTIFICATION_UI         =         41u16
    PROTOCOL_VER_MINOR_MIN_FOR_PROTO_BUF_SERVICE_MODULE_CALLS      =         42u16
    PROTOCOL_VER_MINOR_MIN_FOR_GZIP_MULTI_MESSAGES                 =         43u16
    PROTOCOL_VER_MINOR_MIN_FOR_NEW_VOICE_CALL_AUTHORIZE            =         44u16
    PROTOCOL_VER_MINOR_MIN_FOR_CLIENT_INSTANCE_I_DS                =         44u16

    def initialize
    end

    def deserialize(io : IO::Memory)
    end

    def serialize(io : IO::Memory)
    end
  end
end

module Steamcr
  class MsgClientVACBanStatus
    @num_bans : UInt32

    property num_bans

    def initialize(@num_bans : UInt32)
    end

    def deserialize(io : IO::Memory)
      @num_bans = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@num_bans)
    end
  end
end

module Steamcr
  class MsgClientAppUsageEvent
    @app_usage_event : EAppUsageEvent
    @game_id : UInt64
    @offline : UInt16

    property app_usage_event
    property game_id
    property offline

    def initialize(@app_usage_event : EAppUsageEvent, @game_id : UInt64, @offline : UInt16)
    end

    def deserialize(io : IO::Memory)
      @app_usage_event = io.read_bytes(EAppUsageEvent)
      @game_id = io.read_bytes(UInt64)
      @offline = io.read_bytes(UInt16)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@app_usage_event)
      io.write_bytes(@game_id)
      io.write_bytes(@offline)
    end
  end
end

module Steamcr
  class MsgClientEmailAddrInfo
    def initialize
    end

    def deserialize(io : IO::Memory)
    end

    def serialize(io : IO::Memory)
    end
  end
end

module Steamcr
  class MsgClientUpdateGuestPassesList
    @result : EResult
    @count_guest_passes_to_give : Int32
    @count_guest_passes_to_redeem : Int32

    property result
    property count_guest_passes_to_give
    property count_guest_passes_to_redeem

    def initialize(@result : EResult, @count_guest_passes_to_give : Int32, @count_guest_passes_to_redeem : Int32)
    end

    def deserialize(io : IO::Memory)
      @result = io.read_bytes(EResult)
      @count_guest_passes_to_give = io.read_bytes(Int32)
      @count_guest_passes_to_redeem = io.read_bytes(Int32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@result)
      io.write_bytes(@count_guest_passes_to_give)
      io.write_bytes(@count_guest_passes_to_redeem)
    end
  end
end

module Steamcr
  class MsgClientRequestedClientStats
    def initialize
    end

    def deserialize(io : IO::Memory)
    end

    def serialize(io : IO::Memory)
    end
  end
end

module Steamcr
  class MsgClientP2PIntroducerMessage
    @steam_id : UInt64
    @routing_type : EIntroducerRouting
    @data : UInt8
    @data_len : UInt32

    property steam_id
    property routing_type
    property data
    property data_len

    def initialize(@steam_id : UInt64, @routing_type : EIntroducerRouting, @data : UInt8, @data_len : UInt32)
    end

    def deserialize(io : IO::Memory)
      @steam_id = io.read_bytes(UInt64)
      @routing_type = io.read_bytes(EIntroducerRouting)
      @data = io.read_bytes(UInt8)
      @data_len = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id)
      io.write_bytes(@routing_type)
      io.write_bytes(@data)
      io.write_bytes(@data_len)
    end
  end
end

module Steamcr
  class MsgClientOGSBeginSession
    @account_type : UInt8
    @account_id : UInt64
    @app_id : UInt32
    @time_started : UInt32

    property account_type
    property account_id
    property app_id
    property time_started

    def initialize(@account_type : UInt8, @account_id : UInt64, @app_id : UInt32, @time_started : UInt32)
    end

    def deserialize(io : IO::Memory)
      @account_type = io.read_bytes(UInt8)
      @account_id = io.read_bytes(UInt64)
      @app_id = io.read_bytes(UInt32)
      @time_started = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@account_type)
      io.write_bytes(@account_id)
      io.write_bytes(@app_id)
      io.write_bytes(@time_started)
    end
  end
end

module Steamcr
  class MsgClientOGSBeginSessionResponse
    @result : EResult
    @collecting_any : UInt8
    @collecting_details : UInt8
    @session_id : UInt64

    property result
    property collecting_any
    property collecting_details
    property session_id

    def initialize(@result : EResult, @collecting_any : UInt8, @collecting_details : UInt8, @session_id : UInt64)
    end

    def deserialize(io : IO::Memory)
      @result = io.read_bytes(EResult)
      @collecting_any = io.read_bytes(UInt8)
      @collecting_details = io.read_bytes(UInt8)
      @session_id = io.read_bytes(UInt64)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@result)
      io.write_bytes(@collecting_any)
      io.write_bytes(@collecting_details)
      io.write_bytes(@session_id)
    end
  end
end

module Steamcr
  class MsgClientOGSEndSession
    @session_id : UInt64
    @time_ended : UInt32
    @reason_code : Int32
    @count_attributes : Int32

    property session_id
    property time_ended
    property reason_code
    property count_attributes

    def initialize(@session_id : UInt64, @time_ended : UInt32, @reason_code : Int32, @count_attributes : Int32)
    end

    def deserialize(io : IO::Memory)
      @session_id = io.read_bytes(UInt64)
      @time_ended = io.read_bytes(UInt32)
      @reason_code = io.read_bytes(Int32)
      @count_attributes = io.read_bytes(Int32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@session_id)
      io.write_bytes(@time_ended)
      io.write_bytes(@reason_code)
      io.write_bytes(@count_attributes)
    end
  end
end

module Steamcr
  class MsgClientOGSEndSessionResponse
    @result : EResult

    property result

    def initialize(@result : EResult)
    end

    def deserialize(io : IO::Memory)
      @result = io.read_bytes(EResult)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@result)
    end
  end
end

module Steamcr
  class MsgClientOGSWriteRow
    @session_id : UInt64
    @count_attributes : Int32

    property session_id
    property count_attributes

    def initialize(@session_id : UInt64, @count_attributes : Int32)
    end

    def deserialize(io : IO::Memory)
      @session_id = io.read_bytes(UInt64)
      @count_attributes = io.read_bytes(Int32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@session_id)
      io.write_bytes(@count_attributes)
    end
  end
end

module Steamcr
  class MsgClientGetFriendsWhoPlayGame
    @game_id : UInt64

    property game_id

    def initialize(@game_id : UInt64)
    end

    def deserialize(io : IO::Memory)
      @game_id = io.read_bytes(UInt64)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@game_id)
    end
  end
end

module Steamcr
  class MsgClientGetFriendsWhoPlayGameResponse
    @result : EResult
    @game_id : UInt64
    @count_friends : UInt32

    property result
    property game_id
    property count_friends

    def initialize(@result : EResult, @game_id : UInt64, @count_friends : UInt32)
    end

    def deserialize(io : IO::Memory)
      @result = io.read_bytes(EResult)
      @game_id = io.read_bytes(UInt64)
      @count_friends = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@result)
      io.write_bytes(@game_id)
      io.write_bytes(@count_friends)
    end
  end
end

module Steamcr
  class MsgGSPerformHardwareSurvey
    @flags : UInt32

    property flags

    def initialize(@flags : UInt32)
    end

    def deserialize(io : IO::Memory)
      @flags = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@flags)
    end
  end
end

module Steamcr
  class MsgGSGetPlayStatsResponse
    @result : EResult
    @rank : Int32
    @lifetime_connects : UInt32
    @lifetime_minutes_played : UInt32

    property result
    property rank
    property lifetime_connects
    property lifetime_minutes_played

    def initialize(@result : EResult, @rank : Int32, @lifetime_connects : UInt32, @lifetime_minutes_played : UInt32)
    end

    def deserialize(io : IO::Memory)
      @result = io.read_bytes(EResult)
      @rank = io.read_bytes(Int32)
      @lifetime_connects = io.read_bytes(UInt32)
      @lifetime_minutes_played = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@result)
      io.write_bytes(@rank)
      io.write_bytes(@lifetime_connects)
      io.write_bytes(@lifetime_minutes_played)
    end
  end
end

module Steamcr
  class MsgGSGetReputationResponse
    @result : EResult
    @reputation_score : UInt32
    @banned : UInt8
    @banned_ip : UInt32
    @banned_port : UInt16
    @banned_game_id : UInt64
    @time_ban_expires : UInt32

    property result
    property reputation_score
    property banned
    property banned_ip
    property banned_port
    property banned_game_id
    property time_ban_expires

    def initialize(@result : EResult, @reputation_score : UInt32, @banned : UInt8, @banned_ip : UInt32, @banned_port : UInt16, @banned_game_id : UInt64, @time_ban_expires : UInt32)
    end

    def deserialize(io : IO::Memory)
      @result = io.read_bytes(EResult)
      @reputation_score = io.read_bytes(UInt32)
      @banned = io.read_bytes(UInt8)
      @banned_ip = io.read_bytes(UInt32)
      @banned_port = io.read_bytes(UInt16)
      @banned_game_id = io.read_bytes(UInt64)
      @time_ban_expires = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@result)
      io.write_bytes(@reputation_score)
      io.write_bytes(@banned)
      io.write_bytes(@banned_ip)
      io.write_bytes(@banned_port)
      io.write_bytes(@banned_game_id)
      io.write_bytes(@time_ban_expires)
    end
  end
end

module Steamcr
  class MsgGSDeny
    @steam_id : UInt64
    @deny_reason : EDenyReason

    property steam_id
    property deny_reason

    def initialize(@steam_id : UInt64, @deny_reason : EDenyReason)
    end

    def deserialize(io : IO::Memory)
      @steam_id = io.read_bytes(UInt64)
      @deny_reason = io.read_bytes(EDenyReason)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id)
      io.write_bytes(@deny_reason)
    end
  end
end

module Steamcr
  class MsgGSApprove
    @steam_id : UInt64

    property steam_id

    def initialize(@steam_id : UInt64)
    end

    def deserialize(io : IO::Memory)
      @steam_id = io.read_bytes(UInt64)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id)
    end
  end
end

module Steamcr
  class MsgGSKick
    @steam_id : UInt64
    @deny_reason : EDenyReason
    @wait_til_map_change : Int32

    property steam_id
    property deny_reason
    property wait_til_map_change

    def initialize(@steam_id : UInt64, @deny_reason : EDenyReason, @wait_til_map_change : Int32)
    end

    def deserialize(io : IO::Memory)
      @steam_id = io.read_bytes(UInt64)
      @deny_reason = io.read_bytes(EDenyReason)
      @wait_til_map_change = io.read_bytes(Int32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id)
      io.write_bytes(@deny_reason)
      io.write_bytes(@wait_til_map_change)
    end
  end
end

module Steamcr
  class MsgGSGetUserGroupStatus
    @steam_id_user : UInt64
    @steam_id_group : UInt64

    property steam_id_user
    property steam_id_group

    def initialize(@steam_id_user : UInt64, @steam_id_group : UInt64)
    end

    def deserialize(io : IO::Memory)
      @steam_id_user = io.read_bytes(UInt64)
      @steam_id_group = io.read_bytes(UInt64)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id_user)
      io.write_bytes(@steam_id_group)
    end
  end
end

module Steamcr
  class MsgGSGetUserGroupStatusResponse
    @steam_id_user : UInt64
    @steam_id_group : UInt64
    @clan_relationship : EClanRelationship
    @clan_rank : EClanRank

    property steam_id_user
    property steam_id_group
    property clan_relationship
    property clan_rank

    def initialize(@steam_id_user : UInt64, @steam_id_group : UInt64, @clan_relationship : EClanRelationship, @clan_rank : EClanRank)
    end

    def deserialize(io : IO::Memory)
      @steam_id_user = io.read_bytes(UInt64)
      @steam_id_group = io.read_bytes(UInt64)
      @clan_relationship = io.read_bytes(EClanRelationship)
      @clan_rank = io.read_bytes(EClanRank)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id_user)
      io.write_bytes(@steam_id_group)
      io.write_bytes(@clan_relationship)
      io.write_bytes(@clan_rank)
    end
  end
end

module Steamcr
  class MsgClientJoinChat
    @steam_id_chat : UInt64
    @is_voice_speaker : UInt8

    property steam_id_chat
    property is_voice_speaker

    def initialize(@steam_id_chat : UInt64, @is_voice_speaker : UInt8)
    end

    def deserialize(io : IO::Memory)
      @steam_id_chat = io.read_bytes(UInt64)
      @is_voice_speaker = io.read_bytes(UInt8)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id_chat)
      io.write_bytes(@is_voice_speaker)
    end
  end
end

module Steamcr
  class MsgClientChatEnter
    @steam_id_chat : UInt64
    @steam_id_friend : UInt64
    @chat_room_type : EChatRoomType
    @steam_id_owner : UInt64
    @steam_id_clan : UInt64
    @chat_flags : UInt8
    @enter_response : EChatRoomEnterResponse
    @num_members : Int32

    property steam_id_chat
    property steam_id_friend
    property chat_room_type
    property steam_id_owner
    property steam_id_clan
    property chat_flags
    property enter_response
    property num_members

    def initialize(@steam_id_chat : UInt64, @steam_id_friend : UInt64, @chat_room_type : EChatRoomType, @steam_id_owner : UInt64, @steam_id_clan : UInt64, @chat_flags : UInt8, @enter_response : EChatRoomEnterResponse, @num_members : Int32)
    end

    def deserialize(io : IO::Memory)
      @steam_id_chat = io.read_bytes(UInt64)
      @steam_id_friend = io.read_bytes(UInt64)
      @chat_room_type = io.read_bytes(EChatRoomType)
      @steam_id_owner = io.read_bytes(UInt64)
      @steam_id_clan = io.read_bytes(UInt64)
      @chat_flags = io.read_bytes(UInt8)
      @enter_response = io.read_bytes(EChatRoomEnterResponse)
      @num_members = io.read_bytes(Int32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id_chat)
      io.write_bytes(@steam_id_friend)
      io.write_bytes(@chat_room_type)
      io.write_bytes(@steam_id_owner)
      io.write_bytes(@steam_id_clan)
      io.write_bytes(@chat_flags)
      io.write_bytes(@enter_response)
      io.write_bytes(@num_members)
    end
  end
end

module Steamcr
  class MsgClientChatMsg
    @steam_id_chatter : UInt64
    @steam_id_chat_room : UInt64
    @chat_msg_type : EChatEntryType

    property steam_id_chatter
    property steam_id_chat_room
    property chat_msg_type

    def initialize(@steam_id_chatter : UInt64, @steam_id_chat_room : UInt64, @chat_msg_type : EChatEntryType)
    end

    def deserialize(io : IO::Memory)
      @steam_id_chatter = io.read_bytes(UInt64)
      @steam_id_chat_room = io.read_bytes(UInt64)
      @chat_msg_type = io.read_bytes(EChatEntryType)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id_chatter)
      io.write_bytes(@steam_id_chat_room)
      io.write_bytes(@chat_msg_type)
    end
  end
end

module Steamcr
  class MsgClientChatMemberInfo
    @steam_id_chat : UInt64
    @type : EChatInfoType

    property steam_id_chat
    property type

    def initialize(@steam_id_chat : UInt64, @type : EChatInfoType)
    end

    def deserialize(io : IO::Memory)
      @steam_id_chat = io.read_bytes(UInt64)
      @type = io.read_bytes(EChatInfoType)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id_chat)
      io.write_bytes(@type)
    end
  end
end

module Steamcr
  class MsgClientChatAction
    @steam_id_chat : UInt64
    @steam_id_user_to_act_on : UInt64
    @chat_action : EChatAction

    property steam_id_chat
    property steam_id_user_to_act_on
    property chat_action

    def initialize(@steam_id_chat : UInt64, @steam_id_user_to_act_on : UInt64, @chat_action : EChatAction)
    end

    def deserialize(io : IO::Memory)
      @steam_id_chat = io.read_bytes(UInt64)
      @steam_id_user_to_act_on = io.read_bytes(UInt64)
      @chat_action = io.read_bytes(EChatAction)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id_chat)
      io.write_bytes(@steam_id_user_to_act_on)
      io.write_bytes(@chat_action)
    end
  end
end

module Steamcr
  class MsgClientChatActionResult
    @steam_id_chat : UInt64
    @steam_id_user_acted_on : UInt64
    @chat_action : EChatAction
    @action_result : EChatActionResult

    property steam_id_chat
    property steam_id_user_acted_on
    property chat_action
    property action_result

    def initialize(@steam_id_chat : UInt64, @steam_id_user_acted_on : UInt64, @chat_action : EChatAction, @action_result : EChatActionResult)
    end

    def deserialize(io : IO::Memory)
      @steam_id_chat = io.read_bytes(UInt64)
      @steam_id_user_acted_on = io.read_bytes(UInt64)
      @chat_action = io.read_bytes(EChatAction)
      @action_result = io.read_bytes(EChatActionResult)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id_chat)
      io.write_bytes(@steam_id_user_acted_on)
      io.write_bytes(@chat_action)
      io.write_bytes(@action_result)
    end
  end
end

module Steamcr
  class MsgClientChatRoomInfo
    @steam_id_chat : UInt64
    @type : EChatInfoType

    property steam_id_chat
    property type

    def initialize(@steam_id_chat : UInt64, @type : EChatInfoType)
    end

    def deserialize(io : IO::Memory)
      @steam_id_chat = io.read_bytes(UInt64)
      @type = io.read_bytes(EChatInfoType)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@steam_id_chat)
      io.write_bytes(@type)
    end
  end
end

module Steamcr
  class MsgClientSetIgnoreFriend
    @my_steam_id : UInt64
    @steam_id_friend : UInt64
    @ignore : UInt8

    property my_steam_id
    property steam_id_friend
    property ignore

    def initialize(@my_steam_id : UInt64, @steam_id_friend : UInt64, @ignore : UInt8)
    end

    def deserialize(io : IO::Memory)
      @my_steam_id = io.read_bytes(UInt64)
      @steam_id_friend = io.read_bytes(UInt64)
      @ignore = io.read_bytes(UInt8)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@my_steam_id)
      io.write_bytes(@steam_id_friend)
      io.write_bytes(@ignore)
    end
  end
end

module Steamcr
  class MsgClientSetIgnoreFriendResponse
    @friend_id : UInt64
    @result : EResult

    property friend_id
    property result

    def initialize(@friend_id : UInt64, @result : EResult)
    end

    def deserialize(io : IO::Memory)
      @friend_id = io.read_bytes(UInt64)
      @result = io.read_bytes(EResult)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@friend_id)
      io.write_bytes(@result)
    end
  end
end

module Steamcr
  class MsgClientLoggedOff
    @result : EResult
    @sec_min_reconnect_hint : Int32
    @sec_max_reconnect_hint : Int32

    property result
    property sec_min_reconnect_hint
    property sec_max_reconnect_hint

    def initialize(@result : EResult, @sec_min_reconnect_hint : Int32, @sec_max_reconnect_hint : Int32)
    end

    def deserialize(io : IO::Memory)
      @result = io.read_bytes(EResult)
      @sec_min_reconnect_hint = io.read_bytes(Int32)
      @sec_max_reconnect_hint = io.read_bytes(Int32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@result)
      io.write_bytes(@sec_min_reconnect_hint)
      io.write_bytes(@sec_max_reconnect_hint)
    end
  end
end

module Steamcr
  class MsgClientLogOnResponse
    @result : EResult
    @out_of_game_heartbeat_rate_sec : Int32
    @in_game_heartbeat_rate_sec : Int32
    @client_supplied_steam_id : UInt64
    @ip_public : UInt32
    @server_real_time : UInt32

    property result
    property out_of_game_heartbeat_rate_sec
    property in_game_heartbeat_rate_sec
    property client_supplied_steam_id
    property ip_public
    property server_real_time

    def initialize(@result : EResult, @out_of_game_heartbeat_rate_sec : Int32, @in_game_heartbeat_rate_sec : Int32, @client_supplied_steam_id : UInt64, @ip_public : UInt32, @server_real_time : UInt32)
    end

    def deserialize(io : IO::Memory)
      @result = io.read_bytes(EResult)
      @out_of_game_heartbeat_rate_sec = io.read_bytes(Int32)
      @in_game_heartbeat_rate_sec = io.read_bytes(Int32)
      @client_supplied_steam_id = io.read_bytes(UInt64)
      @ip_public = io.read_bytes(UInt32)
      @server_real_time = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@result)
      io.write_bytes(@out_of_game_heartbeat_rate_sec)
      io.write_bytes(@in_game_heartbeat_rate_sec)
      io.write_bytes(@client_supplied_steam_id)
      io.write_bytes(@ip_public)
      io.write_bytes(@server_real_time)
    end
  end
end

module Steamcr
  class MsgClientSendGuestPass
    def initialize
    end

    def deserialize(io : IO::Memory)
    end

    def serialize(io : IO::Memory)
    end
  end
end

module Steamcr
  class MsgClientSendGuestPassResponse
    def initialize
    end

    def deserialize(io : IO::Memory)
    end

    def serialize(io : IO::Memory)
    end
  end
end

module Steamcr
  class MsgClientServerUnavailable
    @jobid_sent : UInt64
    @e_msg_sent : UInt32
    @e_server_type_unavailable : EServerType

    property jobid_sent
    property e_msg_sent
    property e_server_type_unavailable

    def initialize(@jobid_sent : UInt64, @e_msg_sent : UInt32, @e_server_type_unavailable : EServerType)
    end

    def deserialize(io : IO::Memory)
      @jobid_sent = io.read_bytes(UInt64)
      @e_msg_sent = io.read_bytes(UInt32)
      @e_server_type_unavailable = io.read_bytes(EServerType)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@jobid_sent)
      io.write_bytes(@e_msg_sent)
      io.write_bytes(@e_server_type_unavailable)
    end
  end
end

module Steamcr
  class MsgClientCreateChat
    @chat_room_type : EChatRoomType
    @game_id : UInt64
    @steam_id_clan : UInt64
    @permission_officer : EChatPermission
    @permission_member : EChatPermission
    @permission_all : EChatPermission
    @members_max : UInt32
    @chat_flags : UInt8
    @steam_id_friend_chat : UInt64
    @steam_id_invited : UInt64

    property chat_room_type
    property game_id
    property steam_id_clan
    property permission_officer
    property permission_member
    property permission_all
    property members_max
    property chat_flags
    property steam_id_friend_chat
    property steam_id_invited

    def initialize(@chat_room_type : EChatRoomType, @game_id : UInt64, @steam_id_clan : UInt64, @permission_officer : EChatPermission, @permission_member : EChatPermission, @permission_all : EChatPermission, @members_max : UInt32, @chat_flags : UInt8, @steam_id_friend_chat : UInt64, @steam_id_invited : UInt64)
    end

    def deserialize(io : IO::Memory)
      @chat_room_type = io.read_bytes(EChatRoomType)
      @game_id = io.read_bytes(UInt64)
      @steam_id_clan = io.read_bytes(UInt64)
      @permission_officer = io.read_bytes(EChatPermission)
      @permission_member = io.read_bytes(EChatPermission)
      @permission_all = io.read_bytes(EChatPermission)
      @members_max = io.read_bytes(UInt32)
      @chat_flags = io.read_bytes(UInt8)
      @steam_id_friend_chat = io.read_bytes(UInt64)
      @steam_id_invited = io.read_bytes(UInt64)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@chat_room_type)
      io.write_bytes(@game_id)
      io.write_bytes(@steam_id_clan)
      io.write_bytes(@permission_officer)
      io.write_bytes(@permission_member)
      io.write_bytes(@permission_all)
      io.write_bytes(@members_max)
      io.write_bytes(@chat_flags)
      io.write_bytes(@steam_id_friend_chat)
      io.write_bytes(@steam_id_invited)
    end
  end
end

module Steamcr
  class MsgClientCreateChatResponse
    @result : EResult
    @steam_id_chat : UInt64
    @chat_room_type : EChatRoomType
    @steam_id_friend_chat : UInt64

    property result
    property steam_id_chat
    property chat_room_type
    property steam_id_friend_chat

    def initialize(@result : EResult, @steam_id_chat : UInt64, @chat_room_type : EChatRoomType, @steam_id_friend_chat : UInt64)
    end

    def deserialize(io : IO::Memory)
      @result = io.read_bytes(EResult)
      @steam_id_chat = io.read_bytes(UInt64)
      @chat_room_type = io.read_bytes(EChatRoomType)
      @steam_id_friend_chat = io.read_bytes(UInt64)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@result)
      io.write_bytes(@steam_id_chat)
      io.write_bytes(@chat_room_type)
      io.write_bytes(@steam_id_friend_chat)
    end
  end
end

module Steamcr
  class MsgClientMarketingMessageUpdate2
    @marketing_message_update_time : UInt32
    @count : UInt32

    property marketing_message_update_time
    property count

    def initialize(@marketing_message_update_time : UInt32, @count : UInt32)
    end

    def deserialize(io : IO::Memory)
      @marketing_message_update_time = io.read_bytes(UInt32)
      @count = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@marketing_message_update_time)
      io.write_bytes(@count)
    end
  end
end

module Steamcr
  class MsgClientGetLegacyGameKey
    @app_id : UInt32

    property app_id

    def initialize(@app_id : UInt32)
    end

    def deserialize(io : IO::Memory)
      @app_id = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@app_id)
    end
  end
end

module Steamcr
  class MsgClientGetLegacyGameKeyResponse
    @app_id : UInt32
    @result : EResult
    @length : UInt32

    property app_id
    property result
    property length

    def initialize(@app_id : UInt32, @result : EResult, @length : UInt32)
    end

    def deserialize(io : IO::Memory)
      @app_id = io.read_bytes(UInt32)
      @result = io.read_bytes(EResult)
      @length = io.read_bytes(UInt32)
    end

    def serialize(io : IO::Memory)
      io.write_bytes(@app_id)
      io.write_bytes(@result)
      io.write_bytes(@length)
    end
  end
end
