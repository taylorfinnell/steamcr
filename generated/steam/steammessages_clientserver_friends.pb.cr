## Generated from steammessages_clientserver_friends.proto
require "protobuf"

module Steam
  
  struct CMsgClientFriendMsg
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :chat_entry_type, :int32, 2
      optional :message, :bytes, 3
      optional :rtime32_server_timestamp, :fixed32, 4
      optional :echo_to_sender, :bool, 5
    end
  end
  
  struct CMsgClientFriendMsgIncoming
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid_from, :fixed64, 1
      optional :chat_entry_type, :int32, 2
      optional :from_limited_account, :bool, 3
      optional :message, :bytes, 4
      optional :rtime32_server_timestamp, :fixed32, 5
    end
  end
  
  struct CMsgClientAddFriend
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid_to_add, :fixed64, 1
      optional :accountname_or_email_to_add, :string, 2
    end
  end
  
  struct CMsgClientAddFriendResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :steam_id_added, :fixed64, 2
      optional :persona_name_added, :string, 3
    end
  end
  
  struct CMsgClientRemoveFriend
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :friendid, :fixed64, 1
    end
  end
  
  struct CMsgClientHideFriend
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :friendid, :fixed64, 1
      optional :hide, :bool, 2
    end
  end
  
  struct CMsgClientFriendsList
    include Protobuf::Message
    
    struct Friend
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :ulfriendid, :fixed64, 1
        optional :efriendrelationship, :uint32, 2
      end
    end
    
    contract_of "proto2" do
      optional :bincremental, :bool, 1
      repeated :friends, CMsgClientFriendsList::Friend, 2
      optional :max_friend_count, :uint32, 3
      optional :active_friend_count, :uint32, 4
      optional :friends_limit_hit, :bool, 5
    end
  end
  
  struct CMsgClientFriendsGroupsList
    include Protobuf::Message
    
    struct FriendGroup
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :n_group_id, :int32, 1
        optional :str_group_name, :string, 2
      end
    end
    
    struct FriendGroupsMembership
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :ul_steam_id, :fixed64, 1
        optional :n_group_id, :int32, 2
      end
    end
    
    contract_of "proto2" do
      optional :bremoval, :bool, 1
      optional :bincremental, :bool, 2
      repeated :friend_groups, CMsgClientFriendsGroupsList::FriendGroup, 3
      repeated :memberships, CMsgClientFriendsGroupsList::FriendGroupsMembership, 4
    end
  end
  
  struct CMsgClientPlayerNicknameList
    include Protobuf::Message
    
    struct PlayerNickname
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :steamid, :fixed64, 1
        optional :nickname, :string, 3
      end
    end
    
    contract_of "proto2" do
      optional :removal, :bool, 1
      optional :incremental, :bool, 2
      repeated :nicknames, CMsgClientPlayerNicknameList::PlayerNickname, 3
    end
  end
  
  struct CMsgClientSetPlayerNickname
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :nickname, :string, 2
    end
  end
  
  struct CMsgClientSetPlayerNicknameResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :uint32, 1
    end
  end
  
  struct CMsgClientRequestFriendData
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :persona_state_requested, :uint32, 1
      repeated :friends, :fixed64, 2
    end
  end
  
  struct CMsgClientChangeStatus
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :persona_state, :uint32, 1
      optional :player_name, :string, 2
      optional :is_auto_generated_name, :bool, 3
      optional :high_priority, :bool, 4
      optional :persona_set_by_user, :bool, 5
      optional :persona_state_flags, :uint32, 6, default: 0_u32
      optional :need_persona_response, :bool, 7
      optional :is_client_idle, :bool, 8
    end
  end
  
  struct CMsgPersonaChangeResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :result, :uint32, 1
      optional :player_name, :string, 2
    end
  end
  
  struct CMsgClientPersonaState
    include Protobuf::Message
    
    struct Friend
      include Protobuf::Message
      
      struct ClanData
        include Protobuf::Message
        
        contract_of "proto2" do
          optional :ogg_app_id, :uint32, 1
          optional :chat_group_id, :uint64, 2
        end
      end
      
      struct KV
        include Protobuf::Message
        
        contract_of "proto2" do
          optional :key, :string, 1
          optional :value, :string, 2
        end
      end
      
      contract_of "proto2" do
        optional :friendid, :fixed64, 1
        optional :persona_state, :uint32, 2
        optional :game_played_app_id, :uint32, 3
        optional :game_server_ip, :uint32, 4
        optional :game_server_port, :uint32, 5
        optional :persona_state_flags, :uint32, 6
        optional :online_session_instances, :uint32, 7
        optional :persona_set_by_user, :bool, 10
        optional :player_name, :string, 15
        optional :query_port, :uint32, 20
        optional :steamid_source, :fixed64, 25
        optional :avatar_hash, :bytes, 31
        optional :last_logoff, :uint32, 45
        optional :last_logon, :uint32, 46
        optional :last_seen_online, :uint32, 47
        optional :clan_rank, :uint32, 50
        optional :game_name, :string, 55
        optional :gameid, :fixed64, 56
        optional :game_data_blob, :bytes, 60
        optional :clan_data, CMsgClientPersonaState::Friend::ClanData, 64
        optional :clan_tag, :string, 65
        repeated :rich_presence, CMsgClientPersonaState::Friend::KV, 71
        optional :broadcast_id, :fixed64, 72
        optional :game_lobby_id, :fixed64, 73
        optional :watching_broadcast_accountid, :uint32, 74
        optional :watching_broadcast_appid, :uint32, 75
        optional :watching_broadcast_viewers, :uint32, 76
        optional :watching_broadcast_title, :string, 77
        optional :is_community_banned, :bool, 78
        optional :player_name_pending_review, :bool, 79
        optional :avatar_pending_review, :bool, 80
      end
    end
    
    contract_of "proto2" do
      optional :status_flags, :uint32, 1
      repeated :friends, CMsgClientPersonaState::Friend, 2
    end
  end
  
  struct CMsgClientFriendProfileInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid_friend, :fixed64, 1
    end
  end
  
  struct CMsgClientFriendProfileInfoResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :steamid_friend, :fixed64, 2
      optional :time_created, :uint32, 3
      optional :real_name, :string, 4
      optional :city_name, :string, 5
      optional :state_name, :string, 6
      optional :country_name, :string, 7
      optional :headline, :string, 8
      optional :summary, :string, 9
    end
  end
  
  struct CMsgClientCreateFriendsGroup
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :groupname, :string, 2
      repeated :steamid_friends, :fixed64, 3
    end
  end
  
  struct CMsgClientCreateFriendsGroupResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :uint32, 1
      optional :groupid, :int32, 2
    end
  end
  
  struct CMsgClientDeleteFriendsGroup
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :groupid, :int32, 2
    end
  end
  
  struct CMsgClientDeleteFriendsGroupResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :uint32, 1
    end
  end
  
  struct CMsgClientManageFriendsGroup
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :groupid, :int32, 1
      optional :groupname, :string, 2
      repeated :steamid_friends_added, :fixed64, 3
      repeated :steamid_friends_removed, :fixed64, 4
    end
  end
  
  struct CMsgClientManageFriendsGroupResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :uint32, 1
    end
  end
  
  struct CMsgClientAddFriendToGroup
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :groupid, :int32, 1
      optional :steamiduser, :fixed64, 2
    end
  end
  
  struct CMsgClientAddFriendToGroupResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :uint32, 1
    end
  end
  
  struct CMsgClientRemoveFriendFromGroup
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :groupid, :int32, 1
      optional :steamiduser, :fixed64, 2
    end
  end
  
  struct CMsgClientRemoveFriendFromGroupResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :uint32, 1
    end
  end
  
  struct CMsgClientGetEmoticonList
    include Protobuf::Message
    
    contract_of "proto2" do
    end
  end
  
  struct CMsgClientEmoticonList
    include Protobuf::Message
    
    struct Emoticon
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :name, :string, 1
        optional :count, :int32, 2
        optional :time_last_used, :uint32, 3
        optional :use_count, :uint32, 4
        optional :time_received, :uint32, 5
        optional :appid, :uint32, 6
      end
    end
    
    struct Sticker
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :name, :string, 1
        optional :count, :int32, 2
        optional :time_received, :uint32, 3
        optional :appid, :uint32, 4
        optional :time_last_used, :uint32, 5
        optional :use_count, :uint32, 6
      end
    end
    
    struct Effect
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :name, :string, 1
        optional :count, :int32, 2
        optional :time_received, :uint32, 3
        optional :infinite_use, :bool, 4
        optional :appid, :uint32, 5
      end
    end
    
    contract_of "proto2" do
      repeated :emoticons, CMsgClientEmoticonList::Emoticon, 1
      repeated :stickers, CMsgClientEmoticonList::Sticker, 2
      repeated :effects, CMsgClientEmoticonList::Effect, 3
    end
  end
  end
