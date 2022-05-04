# # Generated from steammessages_clientserver.proto
require "protobuf"

module Steam
  struct CMsgClientRegisterAuthTicketWithCM
    include Protobuf::Message

    contract_of "proto2" do
      optional :protocol_version, :uint32, 1
      optional :ticket, :bytes, 3
      optional :client_instance_id, :uint64, 4
    end
  end

  struct CMsgClientTicketAuthComplete
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
      optional :game_id, :fixed64, 2
      optional :estate, :uint32, 3
      optional :eauth_session_response, :uint32, 4
      optional :deprecated_ticket, :bytes, 5
      optional :ticket_crc, :uint32, 6
      optional :ticket_sequence, :uint32, 7
      optional :owner_steam_id, :fixed64, 8
    end
  end

  struct CMsgClientCMList
    include Protobuf::Message

    contract_of "proto2" do
      repeated :cm_addresses, :uint32, 1
      repeated :cm_ports, :uint32, 2
      repeated :cm_websocket_addresses, :string, 3
      optional :percent_default_to_websocket, :uint32, 4
    end
  end

  struct CMsgClientP2PConnectionInfo
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id_dest, :fixed64, 1
      optional :steam_id_src, :fixed64, 2
      optional :app_id, :uint32, 3
      optional :candidate, :bytes, 4
      optional :legacy_connection_id_src, :fixed64, 5
      optional :rendezvous, :bytes, 6
    end
  end

  struct CMsgClientP2PConnectionFailInfo
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id_dest, :fixed64, 1
      optional :steam_id_src, :fixed64, 2
      optional :app_id, :uint32, 3
      optional :ep2p_session_error, :uint32, 4
      optional :connection_id_dest, :fixed64, 5
      optional :close_reason, :uint32, 7
      optional :close_message, :string, 8
    end
  end

  struct CMsgClientNetworkingCertRequest
    include Protobuf::Message

    contract_of "proto2" do
      optional :key_data, :bytes, 2
      optional :app_id, :uint32, 3
    end
  end

  struct CMsgClientNetworkingCertReply
    include Protobuf::Message

    contract_of "proto2" do
      optional :cert, :bytes, 4
      optional :ca_key_id, :fixed64, 5
      optional :ca_signature, :bytes, 6
    end
  end

  struct CMsgClientNetworkingMobileCertRequest
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
    end
  end

  struct CMsgClientNetworkingMobileCertReply
    include Protobuf::Message

    contract_of "proto2" do
      optional :encoded_cert, :string, 1
    end
  end

  struct CMsgClientGetAppOwnershipTicket
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
    end
  end

  struct CMsgClientGetAppOwnershipTicketResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :uint32, 1, default: 2_u32
      optional :app_id, :uint32, 2
      optional :ticket, :bytes, 3
    end
  end

  struct CMsgClientSessionToken
    include Protobuf::Message

    contract_of "proto2" do
      optional :token, :uint64, 1
    end
  end

  struct CMsgClientGameConnectTokens
    include Protobuf::Message

    contract_of "proto2" do
      optional :max_tokens_to_keep, :uint32, 1, default: 10_u32
      repeated :tokens, :bytes, 2
    end
  end

  struct CMsgClientGamesPlayed
    include Protobuf::Message

    struct GamePlayed
      include Protobuf::Message

      contract_of "proto2" do
        optional :steam_id_gs, :uint64, 1
        optional :game_id, :fixed64, 2
        optional :deprecated_game_ip_address, :uint32, 3
        optional :game_port, :uint32, 4
        optional :is_secure, :bool, 5
        optional :token, :bytes, 6
        optional :game_extra_info, :string, 7
        optional :game_data_blob, :bytes, 8
        optional :process_id, :uint32, 9
        optional :streaming_provider_id, :uint32, 10
        optional :game_flags, :uint32, 11
        optional :owner_id, :uint32, 12
        optional :vr_hmd_vendor, :string, 13
        optional :vr_hmd_model, :string, 14
        optional :launch_option_type, :uint32, 15, default: 0_u32
        optional :primary_controller_type, :int32, 16, default: -1
        optional :primary_steam_controller_serial, :string, 17
        optional :total_steam_controller_count, :uint32, 18, default: 0_u32
        optional :total_non_steam_controller_count, :uint32, 19, default: 0_u32
        optional :controller_workshop_file_id, :uint64, 20, default: 0_u64
        optional :launch_source, :uint32, 21, default: 0_u32
        optional :vr_hmd_runtime, :uint32, 22
        optional :game_ip_address, CMsgIPAddress, 23
        optional :controller_connection_type, :uint32, 24, default: 0_u32
        optional :game_os_platform, :int32, 25
        optional :game_build_id, :uint32, 26
        optional :compat_tool_id, :uint32, 27, default: 0_u32
        optional :compat_tool_cmd, :string, 28
        optional :compat_tool_build_id, :uint32, 29
        optional :beta_name, :string, 30
      end
    end

    contract_of "proto2" do
      repeated :games_played, CMsgClientGamesPlayed::GamePlayed, 1
      optional :client_os_type, :uint32, 2
      optional :cloud_gaming_platform, :uint32, 3
      optional :recent_reauthentication, :bool, 4
    end
  end

  struct CMsgGSApprove
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
      optional :owner_steam_id, :fixed64, 2
    end
  end

  struct CMsgGSDeny
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
      optional :edeny_reason, :int32, 2
      optional :deny_string, :string, 3
    end
  end

  struct CMsgGSKick
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
      optional :edeny_reason, :int32, 2
    end
  end

  struct CMsgClientAuthList
    include Protobuf::Message

    contract_of "proto2" do
      optional :tokens_left, :uint32, 1
      optional :last_request_seq, :uint32, 2
      optional :last_request_seq_from_server, :uint32, 3
      repeated :tickets, CMsgAuthTicket, 4
      repeated :app_ids, :uint32, 5
      optional :message_sequence, :uint32, 6
    end
  end

  struct CMsgClientAuthListAck
    include Protobuf::Message

    contract_of "proto2" do
      repeated :ticket_crc, :uint32, 1
      repeated :app_ids, :uint32, 2
      optional :message_sequence, :uint32, 3
    end
  end

  struct CMsgClientLicenseList
    include Protobuf::Message

    struct License
      include Protobuf::Message

      contract_of "proto2" do
        optional :package_id, :uint32, 1
        optional :time_created, :fixed32, 2
        optional :time_next_process, :fixed32, 3
        optional :minute_limit, :int32, 4
        optional :minutes_used, :int32, 5
        optional :payment_method, :uint32, 6
        optional :flags, :uint32, 7
        optional :purchase_country_code, :string, 8
        optional :license_type, :uint32, 9
        optional :territory_code, :int32, 10
        optional :change_number, :int32, 11
        optional :owner_id, :uint32, 12
        optional :initial_period, :uint32, 13
        optional :initial_time_unit, :uint32, 14
        optional :renewal_period, :uint32, 15
        optional :renewal_time_unit, :uint32, 16
        optional :access_token, :uint64, 17
        optional :master_package_id, :uint32, 18
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      repeated :licenses, CMsgClientLicenseList::License, 2
    end
  end

  struct CMsgClientIsLimitedAccount
    include Protobuf::Message

    contract_of "proto2" do
      optional :bis_limited_account, :bool, 1
      optional :bis_community_banned, :bool, 2
      optional :bis_locked_account, :bool, 3
      optional :bis_limited_account_allowed_to_invite_friends, :bool, 4
    end
  end

  struct CMsgClientRequestedClientStats
    include Protobuf::Message

    struct StatsToSend
      include Protobuf::Message

      contract_of "proto2" do
        optional :client_stat, :uint32, 1
        optional :stat_aggregate_method, :uint32, 2
      end
    end

    contract_of "proto2" do
      repeated :stats_to_send, CMsgClientRequestedClientStats::StatsToSend, 1
    end
  end

  struct CMsgClientStat2
    include Protobuf::Message

    struct StatDetail
      include Protobuf::Message

      contract_of "proto2" do
        optional :client_stat, :uint32, 1
        optional :ll_value, :int64, 2
        optional :time_of_day, :uint32, 3
        optional :cell_id, :uint32, 4
        optional :depot_id, :uint32, 5
        optional :app_id, :uint32, 6
      end
    end

    contract_of "proto2" do
      repeated :stat_detail, CMsgClientStat2::StatDetail, 1
    end
  end

  struct CMsgClientInviteToGame
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id_dest, :fixed64, 1
      optional :steam_id_src, :fixed64, 2
      optional :connect_string, :string, 3
      optional :remote_play, :string, 4
    end
  end

  struct CMsgClientChatInvite
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id_invited, :fixed64, 1
      optional :steam_id_chat, :fixed64, 2
      optional :steam_id_patron, :fixed64, 3
      optional :chatroom_type, :int32, 4
      optional :steam_id_friend_chat, :fixed64, 5
      optional :chat_name, :string, 6
      optional :game_id, :fixed64, 7
    end
  end

  struct CMsgClientConnectionStats
    include Protobuf::Message

    struct Stats_Logon
      include Protobuf::Message

      contract_of "proto2" do
        optional :connect_attempts, :int32, 1
        optional :connect_successes, :int32, 2
        optional :connect_failures, :int32, 3
        optional :connections_dropped, :int32, 4
        optional :seconds_running, :uint32, 5
        optional :msec_tologonthistime, :uint32, 6
        optional :count_bad_cms, :uint32, 7
        optional :no_udp_connectivity, :bool, 8
        optional :no_tcp_connectivity, :bool, 9
        optional :no_websocket_443_connectivity, :bool, 10
        optional :no_websocket_non_443_connectivity, :bool, 11
      end
    end

    struct Stats_UDP
      include Protobuf::Message

      contract_of "proto2" do
        optional :pkts_sent, :uint64, 1
        optional :bytes_sent, :uint64, 2
        optional :pkts_recv, :uint64, 3
        optional :pkts_processed, :uint64, 4
        optional :bytes_recv, :uint64, 5
      end
    end

    struct Stats_VConn
      include Protobuf::Message

      contract_of "proto2" do
        optional :connections_udp, :uint32, 1
        optional :connections_tcp, :uint32, 2
        optional :stats_udp, CMsgClientConnectionStats::Stats_UDP, 3
        optional :pkts_abandoned, :uint64, 4
        optional :conn_req_received, :uint64, 5
        optional :pkts_resent, :uint64, 6
        optional :msgs_sent, :uint64, 7
        optional :msgs_sent_failed, :uint64, 8
        optional :msgs_recv, :uint64, 9
        optional :datagrams_sent, :uint64, 10
        optional :datagrams_recv, :uint64, 11
        optional :bad_pkts_recv, :uint64, 12
        optional :unknown_conn_pkts_recv, :uint64, 13
        optional :missed_pkts_recv, :uint64, 14
        optional :dup_pkts_recv, :uint64, 15
        optional :failed_connect_challenges, :uint64, 16
        optional :micro_sec_avg_latency, :uint32, 17
        optional :micro_sec_min_latency, :uint32, 18
        optional :micro_sec_max_latency, :uint32, 19
        optional :mem_pool_msg_in_use, :uint32, 20
      end
    end

    contract_of "proto2" do
      optional :stats_logon, CMsgClientConnectionStats::Stats_Logon, 1
      optional :stats_vconn, CMsgClientConnectionStats::Stats_VConn, 2
    end
  end

  struct CMsgClientServersAvailable
    include Protobuf::Message

    struct Server_Types_Available
      include Protobuf::Message

      contract_of "proto2" do
        optional :server, :uint32, 1
        optional :changed, :bool, 2
      end
    end

    contract_of "proto2" do
      repeated :server_types_available, CMsgClientServersAvailable::Server_Types_Available, 1
      optional :server_type_for_auth_services, :uint32, 2
    end
  end

  struct CMsgClientReportOverlayDetourFailure
    include Protobuf::Message

    contract_of "proto2" do
      repeated :failure_strings, :string, 1
    end
  end

  struct CMsgClientRequestEncryptedAppTicket
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :userdata, :bytes, 2
    end
  end

  struct CMsgClientRequestEncryptedAppTicketResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :eresult, :int32, 2, default: 2
      optional :encrypted_app_ticket, EncryptedAppTicket, 3
    end
  end

  struct CMsgClientWalletInfoUpdate
    include Protobuf::Message

    contract_of "proto2" do
      optional :has_wallet, :bool, 1
      optional :balance, :int32, 2
      optional :currency, :int32, 3
      optional :balance_delayed, :int32, 4
      optional :balance64, :int64, 5
      optional :balance64_delayed, :int64, 6
      optional :realm, :int32, 7
    end
  end

  struct CMsgClientAMGetClanOfficers
    include Protobuf::Message

    contract_of "proto2" do
      optional :steamid_clan, :fixed64, 1
    end
  end

  struct CMsgClientAMGetClanOfficersResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :steamid_clan, :fixed64, 2
      optional :officer_count, :int32, 3
    end
  end

  struct CMsgClientAMGetPersonaNameHistory
    include Protobuf::Message

    struct IdInstance
      include Protobuf::Message

      contract_of "proto2" do
        optional :steamid, :fixed64, 1
      end
    end

    contract_of "proto2" do
      optional :id_count, :int32, 1
      repeated :ids, CMsgClientAMGetPersonaNameHistory::IdInstance, 2
    end
  end

  struct CMsgClientAMGetPersonaNameHistoryResponse
    include Protobuf::Message

    struct NameTableInstance
      include Protobuf::Message

      struct NameInstance
        include Protobuf::Message

        contract_of "proto2" do
          optional :name_since, :fixed32, 1
          optional :name, :string, 2
        end
      end

      contract_of "proto2" do
        optional :eresult, :int32, 1, default: 2
        optional :steamid, :fixed64, 2
        repeated :names, CMsgClientAMGetPersonaNameHistoryResponse::NameTableInstance::NameInstance, 3
      end
    end

    contract_of "proto2" do
      repeated :responses, CMsgClientAMGetPersonaNameHistoryResponse::NameTableInstance, 2
    end
  end

  struct CMsgClientDeregisterWithServer
    include Protobuf::Message

    contract_of "proto2" do
      optional :eservertype, :uint32, 1
      optional :app_id, :uint32, 2
    end
  end

  struct CMsgClientClanState
    include Protobuf::Message

    struct NameInfo
      include Protobuf::Message

      contract_of "proto2" do
        optional :clan_name, :string, 1
        optional :sha_avatar, :bytes, 2
      end
    end

    struct UserCounts
      include Protobuf::Message

      contract_of "proto2" do
        optional :members, :uint32, 1
        optional :online, :uint32, 2
        optional :chatting, :uint32, 3
        optional :in_game, :uint32, 4
        optional :chat_room_members, :uint32, 5
      end
    end

    struct Event
      include Protobuf::Message

      contract_of "proto2" do
        optional :gid, :fixed64, 1
        optional :event_time, :uint32, 2
        optional :headline, :string, 3
        optional :game_id, :fixed64, 4
        optional :just_posted, :bool, 5
      end
    end

    contract_of "proto2" do
      optional :steamid_clan, :fixed64, 1
      optional :clan_account_flags, :uint32, 3
      optional :name_info, CMsgClientClanState::NameInfo, 4
      optional :user_counts, CMsgClientClanState::UserCounts, 5
      repeated :events, CMsgClientClanState::Event, 6
      repeated :announcements, CMsgClientClanState::Event, 7
      optional :chat_room_private, :bool, 8
    end
  end
end
