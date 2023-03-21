## Generated from cstrike15_gcmessages.proto
require "protobuf"

module Csgo
  enum ECsgoGCMsg
    KEMsgGCCStrike15V2Base = 9100
    KEMsgGCCStrike15V2MatchmakingStart = 9101
    KEMsgGCCStrike15V2MatchmakingStop = 9102
    KEMsgGCCStrike15V2MatchmakingClient2ServerPing = 9103
    KEMsgGCCStrike15V2MatchmakingGC2ClientUpdate = 9104
    KEMsgGCCStrike15V2MatchmakingServerReservationResponse = 9106
    KEMsgGCCStrike15V2MatchmakingGC2ClientReserve = 9107
    KEMsgGCCStrike15V2MatchmakingClient2GCHello = 9109
    KEMsgGCCStrike15V2MatchmakingGC2ClientHello = 9110
    KEMsgGCCStrike15V2MatchmakingGC2ClientAbandon = 9112
    KEMsgGCCStrike15V2MatchmakingGCOperationalStats = 9115
    KEMsgGCCStrike15V2MatchmakingOperator2GCBlogUpdate = 9117
    KEMsgGCCStrike15V2ServerNotificationForUserPenalty = 9118
    KEMsgGCCStrike15V2ClientReportPlayer = 9119
    KEMsgGCCStrike15V2ClientReportServer = 9120
    KEMsgGCCStrike15V2ClientCommendPlayer = 9121
    KEMsgGCCStrike15V2ClientReportResponse = 9122
    KEMsgGCCStrike15V2ClientCommendPlayerQuery = 9123
    KEMsgGCCStrike15V2ClientCommendPlayerQueryResponse = 9124
    KEMsgGCCStrike15V2WatchInfoUsers = 9126
    KEMsgGCCStrike15V2ClientRequestPlayersProfile = 9127
    KEMsgGCCStrike15V2PlayersProfile = 9128
    KEMsgGCCStrike15V2PlayerOverwatchCaseUpdate = 9131
    KEMsgGCCStrike15V2PlayerOverwatchCaseAssignment = 9132
    KEMsgGCCStrike15V2PlayerOverwatchCaseStatus = 9133
    KEMsgGCCStrike15V2GC2ClientTextMsg = 9134
    KEMsgGCCStrike15V2Client2GCTextMsg = 9135
    KEMsgGCCStrike15V2MatchEndRunRewardDrops = 9136
    KEMsgGCCStrike15V2MatchEndRewardDropsNotification = 9137
    KEMsgGCCStrike15V2ClientRequestWatchInfoFriends2 = 9138
    KEMsgGCCStrike15V2MatchList = 9139
    KEMsgGCCStrike15V2MatchListRequestCurrentLiveGames = 9140
    KEMsgGCCStrike15V2MatchListRequestRecentUserGames = 9141
    KEMsgGCCStrike15V2GC2ServerReservationUpdate = 9142
    KEMsgGCCStrike15V2ClientVarValueNotificationInfo = 9144
    KEMsgGCCStrike15V2MatchListRequestTournamentGames = 9146
    KEMsgGCCStrike15V2MatchListRequestFullGameInfo = 9147
    KEMsgGCCStrike15V2GiftsLeaderboardRequest = 9148
    KEMsgGCCStrike15V2GiftsLeaderboardResponse = 9149
    KEMsgGCCStrike15V2ServerVarValueNotificationInfo = 9150
    KEMsgGCCStrike15V2ClientSubmitSurveyVote = 9152
    KEMsgGCCStrike15V2Server2GCClientValidate = 9153
    KEMsgGCCStrike15V2MatchListRequestLiveGameForUser = 9154
    KEMsgGCCStrike15V2Client2GCEconPreviewDataBlockRequest = 9156
    KEMsgGCCStrike15V2Client2GCEconPreviewDataBlockResponse = 9157
    KEMsgGCCStrike15V2AccountPrivacySettings = 9158
    KEMsgGCCStrike15V2SetMyActivityInfo = 9159
    KEMsgGCCStrike15V2MatchListRequestTournamentPredictions = 9160
    KEMsgGCCStrike15V2MatchListUploadTournamentPredictions = 9161
    KEMsgGCCStrike15V2DraftSummary = 9162
    KEMsgGCCStrike15V2ClientRequestJoinFriendData = 9163
    KEMsgGCCStrike15V2ClientRequestJoinServerData = 9164
    KEMsgGCCStrike15V2ClientRequestNewMission = 9165
    KEMsgGCCStrike15V2GC2ClientTournamentInfo = 9167
    KEMsgGCGlobalGameSubscribe = 9168
    KEMsgGCGlobalGameUnsubscribe = 9169
    KEMsgGCGlobalGamePlay = 9170
    KEMsgGCCStrike15V2AcknowledgePenalty = 9171
    KEMsgGCCStrike15V2Client2GCRequestPrestigeCoin = 9172
    KEMsgGCCStrike15V2GC2ClientGlobalStats = 9173
    KEMsgGCCStrike15V2Client2GCStreamUnlock = 9174
    KEMsgGCCStrike15V2FantasyRequestClientData = 9175
    KEMsgGCCStrike15V2FantasyUpdateClientData = 9176
    KEMsgGCCStrike15V2GCToClientSteamdatagramTicket = 9177
    KEMsgGCCStrike15V2ClientToGCRequestTicket = 9178
    KEMsgGCCStrike15V2ClientToGCRequestElevate = 9179
    KEMsgGCCStrike15V2GlobalChat = 9180
    KEMsgGCCStrike15V2GlobalChatSubscribe = 9181
    KEMsgGCCStrike15V2GlobalChatUnsubscribe = 9182
    KEMsgGCCStrike15V2ClientAuthKeyCode = 9183
    KEMsgGCCStrike15V2GotvSyncPacket = 9184
    KEMsgGCCStrike15V2ClientPlayerDecalSign = 9185
    KEMsgGCCStrike15V2ClientLogonFatalError = 9187
    KEMsgGCCStrike15V2ClientPollState = 9188
    KEMsgGCCStrike15V2PartyRegister = 9189
    KEMsgGCCStrike15V2PartyUnregister = 9190
    KEMsgGCCStrike15V2PartySearch = 9191
    KEMsgGCCStrike15V2PartyInvite = 9192
    KEMsgGCCStrike15V2AccountRequestCoPlays = 9193
    KEMsgGCCStrike15V2ClientGCRankUpdate = 9194
    KEMsgGCCStrike15V2ClientRequestOffers = 9195
    KEMsgGCCStrike15V2ClientAccountBalance = 9196
    KEMsgGCCStrike15V2ClientPartyJoinRelay = 9197
    KEMsgGCCStrike15V2ClientPartyWarning = 9198
    KEMsgGCCStrike15V2SetEventFavorite = 9200
    KEMsgGCCStrike15V2GetEventFavoritesRequest = 9201
    KEMsgGCCStrike15V2ClientPerfReport = 9202
    KEMsgGCCStrike15V2GetEventFavoritesResponse = 9203
    KEMsgGCCStrike15V2ClientRequestSouvenir = 9204
    KEMsgGCCStrike15V2ClientReportValidation = 9205
    KEMsgGCCStrike15V2GC2ClientRefuseSecureMode = 9206
    KEMsgGCCStrike15V2GC2ClientRequestValidation = 9207
    KEMsgGCCStrike15V2ClientRedeemMissionReward = 9209
    KEMsgGCCStrike15ClientDeepStats = 9210
    KEMsgGCCStrike15StartAgreementSessionInGame = 9211
    KEMsgGCCStrike15V2GC2ClientInitSystem = 9212
    KEMsgGCCStrike15V2GC2ClientInitSystemResponse = 9213
    KEMsgGCCStrike15V2PrivateQueues = 9214
    KEMsgGCCStrike15V2MatchListTournamentOperatorMgmt = 9215
  end
  enum ECsgoSteamUserStat
    KECsgoSteamUserStatXpEarnedGames = 1
    KECsgoSteamUserStatMatchWinsCompetitive = 2
    KECsgoSteamUserStatSurvivedDangerZone = 3
  end
  enum EClientReportingVersion
    KEClientReportingVersionOldVersion = 0
    KEClientReportingVersionBetaVersion = 1
    KEClientReportingVersionSupportsTrustedMode = 2
  end
  enum EInitSystemResult
    KEInitSystemResultInvalid = 0
    KEInitSystemResultSuccess = 1
    KEInitSystemResultNone = 2
    KEInitSystemResultNotFound = 3
    KEInitSystemResultExisting = 4
    KEInitSystemResultFailedOpen = 5
    KEInitSystemResultMismatch = 6
    KEInitSystemResultFailedInit = 7
    KEInitSystemResultMax = 8
  end
  
  struct GameServerPing
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :ping, :int32, 2
      optional :ip, :uint32, 3
      optional :instances, :uint32, 5
    end
  end
  
  struct DataCenterPing
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :data_center_id, :fixed32, 1
      optional :ping, :sint32, 2
    end
  end
  
  struct DetailedSearchStatistic
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :game_type, :uint32, 1
      optional :search_time_avg, :uint32, 2
      optional :players_searching, :uint32, 4
    end
  end
  
  struct TournamentPlayer
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :account_id, :uint32, 1
      optional :player_nick, :string, 2
      optional :player_name, :string, 3
      optional :player_dob, :uint32, 4
      optional :player_flag, :string, 5
      optional :player_location, :string, 6
      optional :player_desc, :string, 7
    end
  end
  
  struct TournamentTeam
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :team_id, :int32, 1
      optional :team_tag, :string, 2
      optional :team_flag, :string, 3
      optional :team_name, :string, 4
      repeated :players, TournamentPlayer, 5
    end
  end
  
  struct TournamentEvent
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :event_id, :int32, 1
      optional :event_tag, :string, 2
      optional :event_name, :string, 3
      optional :event_time_start, :uint32, 4
      optional :event_time_end, :uint32, 5
      optional :event_public, :int32, 6
      optional :event_stage_id, :int32, 7
      optional :event_stage_name, :string, 8
      optional :active_section_id, :uint32, 9
    end
  end
  
  struct GlobalStatistics
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :players_online, :uint32, 1
      optional :servers_online, :uint32, 2
      optional :players_searching, :uint32, 3
      optional :servers_available, :uint32, 4
      optional :ongoing_matches, :uint32, 5
      optional :search_time_avg, :uint32, 6
      repeated :search_statistics, DetailedSearchStatistic, 7
      optional :main_post_url, :string, 8
      optional :required_appid_version, :uint32, 9
      optional :pricesheet_version, :uint32, 10
      optional :twitch_streams_version, :uint32, 11
      optional :active_tournament_eventid, :uint32, 12
      optional :active_survey_id, :uint32, 13
      optional :rtime32_cur, :uint32, 14
      optional :rtime32_event_start, :uint32, 15
    end
  end
  
  struct OperationalStatisticDescription
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :name, :string, 1
      optional :idkey, :uint32, 2
    end
  end
  
  struct OperationalStatisticElement
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :idkey, :uint32, 1
      repeated :values, :int32, 2
    end
  end
  
  struct OperationalStatisticsPacket
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :packetid, :int32, 1
      optional :mstimestamp, :int32, 2
      repeated :values, OperationalStatisticElement, 3
    end
  end
  
  struct PlayerRankingInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :account_id, :uint32, 1
      optional :rank_id, :uint32, 2
      optional :wins, :uint32, 3
      optional :rank_change, :float, 4
      optional :rank_type_id, :uint32, 6
      optional :tv_control, :uint32, 7
    end
  end
  
  struct PlayerCommendationInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :cmd_friendly, :uint32, 1
      optional :cmd_teaching, :uint32, 2
      optional :cmd_leader, :uint32, 4
    end
  end
  
  struct PlayerMedalsInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :display_items_defidx, :uint32, 7
      optional :featured_display_item_defidx, :uint32, 8
    end
  end
  
  struct AccountActivity
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :activity, :uint32, 1
      optional :mode, :uint32, 2
      optional :map, :uint32, 3
      optional :matchid, :uint64, 4
    end
  end
  
  struct TournamentMatchSetup
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :event_id, :int32, 1
      optional :team_id_ct, :int32, 2
      optional :team_id_t, :int32, 3
      optional :event_stage_id, :int32, 4
    end
  end
  
  struct ServerHltvInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :tv_udp_port, :uint32, 1
      optional :tv_watch_key, :uint64, 2
      optional :tv_slots, :uint32, 3
      optional :tv_clients, :uint32, 4
      optional :tv_proxies, :uint32, 5
      optional :tv_time, :uint32, 6
      optional :game_type, :uint32, 8
      optional :game_mapgroup, :string, 9
      optional :game_map, :string, 10
      optional :tv_master_steamid, :uint64, 11
      optional :tv_local_slots, :uint32, 12
      optional :tv_local_clients, :uint32, 13
      optional :tv_local_proxies, :uint32, 14
      optional :tv_relay_slots, :uint32, 15
      optional :tv_relay_clients, :uint32, 16
      optional :tv_relay_proxies, :uint32, 17
      optional :tv_relay_address, :uint32, 18
      optional :tv_relay_port, :uint32, 19
      optional :tv_relay_steamid, :uint64, 20
      optional :flags, :uint32, 21
    end
  end
  
  struct IpAddressMask
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :a, :uint32, 1
      optional :b, :uint32, 2
      optional :c, :uint32, 3
      optional :d, :uint32, 4
      optional :bits, :uint32, 5
      optional :token, :uint32, 6
    end
  end
  
  struct CMsgCsgoSteamUserStatChange
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :ecsgosteamuserstat, :int32, 1
      optional :delta, :int32, 2
      optional :absolute, :bool, 3
    end
  end
  
  struct XpProgressData
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :xp_points, :uint32, 1
      optional :xp_category, :int32, 2
    end
  end
  
  struct MatchEndItemUpdates
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :item_id, :uint64, 1
      optional :item_attr_defidx, :uint32, 2
      optional :item_attr_delta_value, :uint32, 3
    end
  end
  
  struct ScoreLeaderboardData
    include Protobuf::Message
    
    struct Entry
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :tag, :uint32, 1
        optional :val, :uint32, 2
      end
    end
    
    struct AccountEntries
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :accountid, :uint32, 1
        repeated :entries, ScoreLeaderboardData::Entry, 2
      end
    end
    
    contract_of "proto2" do
      optional :quest_id, :uint64, 1
      optional :score, :uint32, 2
      repeated :accountentries, ScoreLeaderboardData::AccountEntries, 3
      repeated :matchentries, ScoreLeaderboardData::Entry, 5
    end
  end
  
  struct PlayerQuestData
    include Protobuf::Message
    
    struct QuestItemData
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :quest_id, :uint64, 1
        optional :quest_normal_points_earned, :int32, 2
        optional :quest_bonus_points_earned, :int32, 3
      end
    end
    
    contract_of "proto2" do
      optional :quester_account_id, :uint32, 1
      repeated :quest_item_data, PlayerQuestData::QuestItemData, 2
      repeated :xp_progress_data, XpProgressData, 3
      optional :time_played, :uint32, 4
      optional :mm_game_mode, :uint32, 5
      repeated :item_updates, MatchEndItemUpdates, 6
      optional :operation_points_eligible, :bool, 7
      repeated :userstatchanges, CMsgCsgoSteamUserStatChange, 8
    end
  end
  
  struct DeepPlayerStatsEntry
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :accountid, :uint32, 1
      optional :match_id, :uint64, 2
      optional :mm_game_mode, :uint32, 3
      optional :mapid, :uint32, 4
      optional :b_starting_ct, :bool, 5
      optional :match_outcome, :uint32, 6
      optional :rounds_won, :uint32, 7
      optional :rounds_lost, :uint32, 8
      optional :stat_score, :uint32, 9
      optional :stat_deaths, :uint32, 12
      optional :stat_mvps, :uint32, 13
      optional :enemy_kills, :uint32, 14
      optional :enemy_headshots, :uint32, 15
      optional :enemy_2ks, :uint32, 16
      optional :enemy_3ks, :uint32, 17
      optional :enemy_4ks, :uint32, 18
      optional :total_damage, :uint32, 19
      optional :engagements_entry_count, :uint32, 23
      optional :engagements_entry_wins, :uint32, 24
      optional :engagements_1v1_count, :uint32, 25
      optional :engagements_1v1_wins, :uint32, 26
      optional :engagements_1v2_count, :uint32, 27
      optional :engagements_1v2_wins, :uint32, 28
      optional :utility_count, :uint32, 29
      optional :utility_success, :uint32, 30
      optional :flash_count, :uint32, 32
      optional :flash_success, :uint32, 33
      repeated :mates, :uint32, 34
    end
  end
  
  struct DeepPlayerMatchEvent
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :accountid, :uint32, 1
      optional :match_id, :uint64, 2
      optional :event_id, :uint32, 3
      optional :event_type, :uint32, 4
      optional :b_playing_ct, :bool, 5
      optional :user_pos_x, :int32, 6
      optional :user_pos_y, :int32, 7
      optional :user_pos_z, :int32, 12
      optional :user_defidx, :uint32, 8
      optional :other_pos_x, :int32, 9
      optional :other_pos_y, :int32, 10
      optional :other_pos_z, :int32, 13
      optional :other_defidx, :uint32, 11
      optional :event_data, :int32, 14
    end
  end
  
  struct CMsgGC_ServerQuestUpdateData
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :player_quest_data, PlayerQuestData, 1
      optional :binary_data, :bytes, 2
      optional :mm_game_mode, :uint32, 3
      optional :missionlbsdata, ScoreLeaderboardData, 4
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingGCOperationalStats
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :packetid, :int32, 1
      repeated :namekeys, OperationalStatisticDescription, 2
      repeated :packets, OperationalStatisticsPacket, 3
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingGC2ServerConfirm
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :token, :uint32, 1
      optional :stamp, :uint32, 2
      optional :exchange, :uint64, 3
    end
  end
  
  struct CMsgGCCStrike15_v2_GC2ServerReservationUpdate
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :viewers_external_total, :uint32, 1
      optional :viewers_external_steam, :uint32, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingStart
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :account_ids, :uint32, 1
      optional :game_type, :uint32, 2
      optional :ticket_data, :string, 3
      optional :client_version, :uint32, 4
      optional :tournament_match, TournamentMatchSetup, 5
      optional :prime_only, :bool, 6
      optional :tv_control, :uint32, 7
      optional :lobby_id, :uint64, 8
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingStop
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :abandon, :int32, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingClient2ServerPing
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :gameserverpings, GameServerPing, 1
      optional :offset_index, :int32, 2
      optional :final_batch, :int32, 3
      repeated :data_center_pings, DataCenterPing, 4
      optional :max_ping, :uint32, 5
      optional :test_token, :fixed32, 6
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingGC2ClientUpdate
    include Protobuf::Message
    
    struct Note
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :type, :int32, 1
        optional :region_id, :int32, 2
        optional :region_r, :float, 3
        optional :distance, :float, 4
      end
    end
    
    contract_of "proto2" do
      optional :matchmaking, :int32, 1
      repeated :waiting_account_id_sessions, :uint32, 2
      optional :error, :string, 3
      repeated :ongoingmatch_account_id_sessions, :uint32, 6
      optional :global_stats, GlobalStatistics, 7
      repeated :failping_account_id_sessions, :uint32, 8
      repeated :penalty_account_id_sessions, :uint32, 9
      repeated :failready_account_id_sessions, :uint32, 10
      repeated :vacbanned_account_id_sessions, :uint32, 11
      optional :server_ipaddress_mask, IpAddressMask, 12
      repeated :notes, CMsgGCCStrike15_v2_MatchmakingGC2ClientUpdate::Note, 13
      repeated :penalty_account_id_sessions_green, :uint32, 14
      repeated :insufficientlevel_sessions, :uint32, 15
      repeated :vsncheck_account_id_sessions, :uint32, 16
      repeated :launcher_mismatch_sessions, :uint32, 17
      repeated :insecure_account_id_sessions, :uint32, 18
    end
  end
  
  struct CDataGCCStrike15_v2_TournamentMatchDraft
    include Protobuf::Message
    
    struct Entry
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :mapid, :int32, 1
        optional :team_id_ct, :int32, 2
      end
    end
    
    contract_of "proto2" do
      optional :event_id, :int32, 1
      optional :event_stage_id, :int32, 2
      optional :team_id_0, :int32, 3
      optional :team_id_1, :int32, 4
      optional :maps_count, :int32, 5
      optional :maps_current, :int32, 6
      optional :team_id_start, :int32, 7
      optional :team_id_veto1, :int32, 8
      optional :team_id_pickn, :int32, 9
      repeated :drafts, CDataGCCStrike15_v2_TournamentMatchDraft::Entry, 10
    end
  end
  
  struct CPreMatchInfoData
    include Protobuf::Message
    
    struct TeamStats
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :match_info_idxtxt, :int32, 1
        optional :match_info_txt, :string, 2
        repeated :match_info_teams, :string, 3
      end
    end
    
    contract_of "proto2" do
      optional :predictions_pct, :int32, 1
      optional :draft, CDataGCCStrike15_v2_TournamentMatchDraft, 4
      repeated :stats, CPreMatchInfoData::TeamStats, 5
      repeated :wins, :int32, 6
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingGC2ServerReserve
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :account_ids, :uint32, 1
      optional :game_type, :uint32, 2
      optional :match_id, :uint64, 3
      optional :server_version, :uint32, 4
      optional :flags, :uint32, 18
      repeated :rankings, PlayerRankingInfo, 5
      optional :encryption_key, :uint64, 6
      optional :encryption_key_pub, :uint64, 7
      repeated :party_ids, :uint32, 8
      repeated :whitelist, IpAddressMask, 9
      optional :tv_master_steamid, :uint64, 10
      optional :tournament_event, TournamentEvent, 11
      repeated :tournament_teams, TournamentTeam, 12
      repeated :tournament_casters_account_ids, :uint32, 13
      optional :tv_relay_steamid, :uint64, 14
      optional :pre_match_data, CPreMatchInfoData, 15
      optional :rtime32_event_start, :uint32, 16
      optional :tv_control, :uint32, 17
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingServerReservationResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :reservationid, :uint64, 1
      optional :reservation, CMsgGCCStrike15_v2_MatchmakingGC2ServerReserve, 2
      optional :map, :string, 3
      optional :gc_reservation_sent, :uint64, 4
      optional :server_version, :uint32, 5
      optional :tv_info, ServerHltvInfo, 6
      repeated :reward_player_accounts, :uint32, 7
      repeated :idle_player_accounts, :uint32, 8
      optional :reward_item_attr_def_idx, :uint32, 9
      optional :reward_item_attr_value, :uint32, 10
      optional :reward_item_attr_reward_idx, :uint32, 11
      optional :reward_drop_list, :uint32, 12
      optional :tournament_tag, :string, 13
      optional :legacy_steamdatagram_port, :uint32, 14
      optional :steamdatagram_routing, :uint32, 17
      optional :test_token, :fixed32, 15
      optional :flags, :uint32, 16
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingGC2ClientReserve
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :serverid, :uint64, 1
      optional :direct_udp_ip, :uint32, 2
      optional :direct_udp_port, :uint32, 3
      optional :reservationid, :uint64, 4
      optional :reservation, CMsgGCCStrike15_v2_MatchmakingGC2ServerReserve, 5
      optional :map, :string, 6
      optional :server_address, :string, 7
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingServerRoundStats
    include Protobuf::Message
    
    struct DropInfo
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :account_mvp, :uint32, 1
      end
    end
    
    contract_of "proto2" do
      optional :reservationid, :uint64, 1
      optional :reservation, CMsgGCCStrike15_v2_MatchmakingGC2ServerReserve, 2
      optional :map, :string, 3
      optional :round, :int32, 4
      repeated :kills, :int32, 5
      repeated :assists, :int32, 6
      repeated :deaths, :int32, 7
      repeated :scores, :int32, 8
      repeated :pings, :int32, 9
      optional :round_result, :int32, 10
      optional :match_result, :int32, 11
      repeated :team_scores, :int32, 12
      optional :confirm, CMsgGCCStrike15_v2_MatchmakingGC2ServerConfirm, 13
      optional :reservation_stage, :int32, 14
      optional :match_duration, :int32, 15
      repeated :enemy_kills, :int32, 16
      repeated :enemy_headshots, :int32, 17
      repeated :enemy_3ks, :int32, 18
      repeated :enemy_4ks, :int32, 19
      repeated :enemy_5ks, :int32, 20
      repeated :mvps, :int32, 21
      optional :spectators_count, :uint32, 22
      optional :spectators_count_tv, :uint32, 23
      optional :spectators_count_lnk, :uint32, 24
      repeated :enemy_kills_agg, :int32, 25
      optional :drop_info, CMsgGCCStrike15_v2_MatchmakingServerRoundStats::DropInfo, 26
      optional :b_switched_teams, :bool, 27
      repeated :enemy_2ks, :int32, 28
      repeated :player_spawned, :int32, 29
      repeated :team_spawn_count, :int32, 30
      optional :max_rounds, :uint32, 31
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingClient2GCHello
    include Protobuf::Message
    
    contract_of "proto2" do
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingGC2ClientHello
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :account_id, :uint32, 1
      optional :ongoingmatch, CMsgGCCStrike15_v2_MatchmakingGC2ClientReserve, 2
      optional :global_stats, GlobalStatistics, 3
      optional :penalty_seconds, :uint32, 4
      optional :penalty_reason, :uint32, 5
      optional :vac_banned, :int32, 6
      optional :ranking, PlayerRankingInfo, 7
      optional :commendation, PlayerCommendationInfo, 8
      optional :medals, PlayerMedalsInfo, 9
      optional :my_current_event, TournamentEvent, 10
      repeated :my_current_event_teams, TournamentTeam, 11
      optional :my_current_team, TournamentTeam, 12
      repeated :my_current_event_stages, TournamentEvent, 13
      optional :survey_vote, :uint32, 14
      optional :activity, AccountActivity, 15
      optional :player_level, :int32, 17
      optional :player_cur_xp, :int32, 18
      optional :player_xp_bonus_flags, :int32, 19
      repeated :rankings, PlayerRankingInfo, 20
    end
  end
  
  struct CMsgGCCStrike15_v2_AccountPrivacySettings
    include Protobuf::Message
    
    struct Setting
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :setting_type, :uint32, 1
        optional :setting_value, :uint32, 2
      end
    end
    
    contract_of "proto2" do
      repeated :settings, CMsgGCCStrike15_v2_AccountPrivacySettings::Setting, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingGC2ClientAbandon
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :account_id, :uint32, 1
      optional :abandoned_match, CMsgGCCStrike15_v2_MatchmakingGC2ClientReserve, 2
      optional :penalty_seconds, :uint32, 3
      optional :penalty_reason, :uint32, 4
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientGCRankUpdate
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :rankings, PlayerRankingInfo, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchmakingOperator2GCBlogUpdate
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :main_post_url, :string, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_ServerNotificationForUserPenalty
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :account_id, :uint32, 1
      optional :reason, :uint32, 2
      optional :seconds, :uint32, 3
      optional :communication_cooldown, :bool, 4
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientReportPlayer
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :account_id, :uint32, 1
      optional :rpt_aimbot, :uint32, 2
      optional :rpt_wallhack, :uint32, 3
      optional :rpt_speedhack, :uint32, 4
      optional :rpt_teamharm, :uint32, 5
      optional :rpt_textabuse, :uint32, 6
      optional :rpt_voiceabuse, :uint32, 7
      optional :match_id, :uint64, 8
      optional :report_from_demo, :bool, 9
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientCommendPlayer
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :account_id, :uint32, 1
      optional :match_id, :uint64, 8
      optional :commendation, PlayerCommendationInfo, 9
      optional :tokens, :uint32, 10
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientReportServer
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :rpt_poorperf, :uint32, 1
      optional :rpt_abusivemodels, :uint32, 2
      optional :rpt_badmotd, :uint32, 3
      optional :rpt_listingabuse, :uint32, 4
      optional :rpt_inventoryabuse, :uint32, 5
      optional :match_id, :uint64, 8
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientReportResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :confirmation_id, :uint64, 1
      optional :account_id, :uint32, 2
      optional :server_ip, :uint32, 3
      optional :response_type, :uint32, 4
      optional :response_result, :uint32, 5
      optional :tokens, :uint32, 6
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientRequestWatchInfoFriends
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :request_id, :uint32, 1
      repeated :account_ids, :uint32, 2
      optional :serverid, :uint64, 3
      optional :matchid, :uint64, 4
      optional :client_launcher, :uint32, 5
      repeated :data_center_pings, DataCenterPing, 6
    end
  end
  
  struct WatchableMatchInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :server_ip, :uint32, 1
      optional :tv_port, :uint32, 2
      optional :tv_spectators, :uint32, 3
      optional :tv_time, :uint32, 4
      optional :tv_watch_password, :bytes, 5
      optional :cl_decryptdata_key, :uint64, 6
      optional :cl_decryptdata_key_pub, :uint64, 7
      optional :game_type, :uint32, 8
      optional :game_mapgroup, :string, 9
      optional :game_map, :string, 10
      optional :server_id, :uint64, 11
      optional :match_id, :uint64, 12
      optional :reservation_id, :uint64, 13
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientRequestJoinFriendData
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :version, :uint32, 1
      optional :account_id, :uint32, 2
      optional :join_token, :uint32, 3
      optional :join_ipp, :uint32, 4
      optional :res, CMsgGCCStrike15_v2_MatchmakingGC2ClientReserve, 5
      optional :errormsg, :string, 6
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientRequestJoinServerData
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :version, :uint32, 1
      optional :account_id, :uint32, 2
      optional :serverid, :uint64, 3
      optional :server_ip, :uint32, 4
      optional :server_port, :uint32, 5
      optional :res, CMsgGCCStrike15_v2_MatchmakingGC2ClientReserve, 6
      optional :errormsg, :string, 7
    end
  end
  
  struct CMsgGCCstrike15_v2_ClientRequestNewMission
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :mission_id, :uint32, 2
      optional :campaign_id, :uint32, 3
    end
  end
  
  struct CMsgGCCstrike15_v2_ClientRedeemMissionReward
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :campaign_id, :uint32, 1
      optional :redeem_id, :uint32, 2
      optional :redeemable_balance, :uint32, 3
      optional :expected_cost, :uint32, 4
    end
  end
  
  struct CMsgGCCstrike15_v2_GC2ServerNotifyXPRewarded
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :xp_progress_data, XpProgressData, 1
      optional :account_id, :uint32, 2
      optional :current_xp, :uint32, 3
      optional :current_level, :uint32, 4
      optional :upgraded_defidx, :uint32, 5
      optional :operation_points_awarded, :uint32, 6
    end
  end
  
  struct CMsgGCCStrike15_ClientDeepStats
    include Protobuf::Message
    
    struct DeepStatsRange
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :begin, :uint32, 1
        optional :end, :uint32, 2
        optional :frozen, :bool, 3
      end
    end
    
    struct DeepStatsMatch
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :player, DeepPlayerStatsEntry, 1
        repeated :events, DeepPlayerMatchEvent, 2
      end
    end
    
    contract_of "proto2" do
      optional :account_id, :uint32, 1
      optional :range, CMsgGCCStrike15_ClientDeepStats::DeepStatsRange, 2
      repeated :matches, CMsgGCCStrike15_ClientDeepStats::DeepStatsMatch, 3
    end
  end
  
  struct CMsgGCCStrike15_v2_WatchInfoUsers
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :request_id, :uint32, 1
      repeated :account_ids, :uint32, 2
      repeated :watchable_match_infos, WatchableMatchInfo, 3
      optional :extended_timeout, :uint32, 5
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientRequestPlayersProfile
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :request_id__deprecated, :uint32, 1
      repeated :account_ids__deprecated, :uint32, 2
      optional :account_id, :uint32, 3
      optional :request_level, :uint32, 4
    end
  end
  
  struct CMsgGCCStrike15_v2_PlayersProfile
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :request_id, :uint32, 1
      repeated :account_profiles, CMsgGCCStrike15_v2_MatchmakingGC2ClientHello, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_PlayerOverwatchCaseUpdate
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :caseid, :uint64, 1
      optional :suspectid, :uint32, 3
      optional :fractionid, :uint32, 4
      optional :rpt_aimbot, :uint32, 5
      optional :rpt_wallhack, :uint32, 6
      optional :rpt_speedhack, :uint32, 7
      optional :rpt_teamharm, :uint32, 8
      optional :reason, :uint32, 9
    end
  end
  
  struct CMsgGCCStrike15_v2_PlayerOverwatchCaseAssignment
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :caseid, :uint64, 1
      optional :caseurl, :string, 2
      optional :verdict, :uint32, 3
      optional :timestamp, :uint32, 4
      optional :throttleseconds, :uint32, 5
      optional :suspectid, :uint32, 6
      optional :fractionid, :uint32, 7
      optional :numrounds, :uint32, 8
      optional :fractionrounds, :uint32, 9
      optional :streakconvictions, :int32, 10
      optional :reason, :uint32, 11
    end
  end
  
  struct CMsgGCCStrike15_v2_PlayerOverwatchCaseStatus
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :caseid, :uint64, 1
      optional :statusid, :uint32, 2
    end
  end
  
  struct CClientHeaderOverwatchEvidence
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :accountid, :uint32, 1
      optional :caseid, :uint64, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_GC2ClientTextMsg
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :id, :uint32, 1
      optional :type, :uint32, 2
      optional :payload, :bytes, 3
    end
  end
  
  struct CMsgGCCStrike15_v2_Client2GCTextMsg
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :id, :uint32, 1
      repeated :args, :bytes, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchEndRunRewardDrops
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :serverinfo, CMsgGCCStrike15_v2_MatchmakingServerReservationResponse, 3
      #optional :match_end_quest_data, CMsgGCServerQuestUpdateData, 4
    end
  end
  
  struct CEconItemPreviewDataBlock
    include Protobuf::Message
    
    struct Sticker
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :slot, :uint32, 1
        optional :sticker_id, :uint32, 2
        optional :wear, :float, 3
        optional :scale, :float, 4
        optional :rotation, :float, 5
        optional :tint_id, :uint32, 6
      end
    end
    
    contract_of "proto2" do
      optional :accountid, :uint32, 1
      optional :itemid, :uint64, 2
      optional :defindex, :uint32, 3
      optional :paintindex, :uint32, 4
      optional :rarity, :uint32, 5
      optional :quality, :uint32, 6
      optional :paintwear, :uint32, 7
      optional :paintseed, :uint32, 8
      optional :killeaterscoretype, :uint32, 9
      optional :killeatervalue, :uint32, 10
      optional :customname, :string, 11
      repeated :stickers, CEconItemPreviewDataBlock::Sticker, 12
      optional :inventory, :uint32, 13
      optional :origin, :uint32, 14
      optional :questid, :uint32, 15
      optional :dropreason, :uint32, 16
      optional :musicindex, :uint32, 17
      optional :entindex, :int32, 18
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchEndRewardDropsNotification
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :iteminfo, CEconItemPreviewDataBlock, 6
    end
  end
  
  struct CMsgItemAcknowledged
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :iteminfo, CEconItemPreviewDataBlock, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_Client2GCEconPreviewDataBlockRequest
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :param_s, :uint64, 1
      optional :param_a, :uint64, 2
      optional :param_d, :uint64, 3
      optional :param_m, :uint64, 4
    end
  end
  
  struct CMsgGCCStrike15_v2_Client2GCEconPreviewDataBlockResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :iteminfo, CEconItemPreviewDataBlock, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchListRequestCurrentLiveGames
    include Protobuf::Message
    
    contract_of "proto2" do
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchListRequestLiveGameForUser
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :accountid, :uint32, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchListRequestRecentUserGames
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :accountid, :uint32, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchListRequestTournamentGames
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eventid, :int32, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchListRequestFullGameInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :matchid, :uint64, 1
      optional :outcomeid, :uint64, 2
      optional :token, :uint32, 3
    end
  end
  
  struct CDataGCCStrike15_v2_MatchInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :matchid, :uint64, 1
      optional :matchtime, :uint32, 2
      optional :watchablematchinfo, WatchableMatchInfo, 3
      optional :roundstats_legacy, CMsgGCCStrike15_v2_MatchmakingServerRoundStats, 4
      repeated :roundstatsall, CMsgGCCStrike15_v2_MatchmakingServerRoundStats, 5
    end
  end
  
  struct CDataGCCStrike15_v2_TournamentGroupTeam
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :team_id, :int32, 1
      optional :score, :int32, 2
      optional :correctpick, :bool, 3
    end
  end
  
  struct CDataGCCStrike15_v2_TournamentGroup
    include Protobuf::Message
    
    struct Picks
      include Protobuf::Message
      
      contract_of "proto2" do
        repeated :pickids, :int32, 1
      end
    end
    
    contract_of "proto2" do
      optional :groupid, :uint32, 1
      optional :name, :string, 2
      optional :desc, :string, 3
      optional :picks__deprecated, :uint32, 4
      repeated :teams, CDataGCCStrike15_v2_TournamentGroupTeam, 5
      repeated :stage_ids, :int32, 6
      optional :picklockuntiltime, :uint32, 7
      optional :pickableteams, :uint32, 8
      optional :points_per_pick, :uint32, 9
      repeated :picks, CDataGCCStrike15_v2_TournamentGroup::Picks, 10
    end
  end
  
  struct CDataGCCStrike15_v2_TournamentSection
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :sectionid, :uint32, 1
      optional :name, :string, 2
      optional :desc, :string, 3
      repeated :groups, CDataGCCStrike15_v2_TournamentGroup, 4
    end
  end
  
  struct CDataGCCStrike15_v2_TournamentInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :sections, CDataGCCStrike15_v2_TournamentSection, 1
      optional :tournament_event, TournamentEvent, 2
      repeated :tournament_teams, TournamentTeam, 3
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchList
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :msgrequestid, :uint32, 1
      optional :accountid, :uint32, 2
      optional :servertime, :uint32, 3
      repeated :matches, CDataGCCStrike15_v2_MatchInfo, 4
      repeated :streams, TournamentTeam, 5
      optional :tournamentinfo, CDataGCCStrike15_v2_TournamentInfo, 6
    end
  end
  
  struct CMsgGCCStrike15_v2_MatchListTournamentOperatorMgmt
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eventid, :int32, 1
      repeated :matches, CDataGCCStrike15_v2_MatchInfo, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_Predictions
    include Protobuf::Message
    
    struct GroupMatchTeamPick
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :sectionid, :int32, 1
        optional :groupid, :int32, 2
        optional :index, :int32, 3
        optional :teamid, :int32, 4
        optional :itemid, :uint64, 5
      end
    end
    
    contract_of "proto2" do
      optional :event_id, :uint32, 1
      repeated :group_match_team_picks, CMsgGCCStrike15_v2_Predictions::GroupMatchTeamPick, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_Fantasy
    include Protobuf::Message
    
    struct FantasySlot
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :type, :int32, 1
        optional :pick, :int32, 2
        optional :itemid, :uint64, 3
      end
    end
    
    struct FantasyTeam
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :sectionid, :int32, 1
        repeated :slots, CMsgGCCStrike15_v2_Fantasy::FantasySlot, 2
      end
    end
    
    contract_of "proto2" do
      optional :event_id, :uint32, 1
      repeated :teams, CMsgGCCStrike15_v2_Fantasy::FantasyTeam, 2
    end
  end
  
  struct CAttribute_String
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :value, :string, 1
    end
  end
  
  struct CMsgCStrike15Welcome
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :store_item_hash, :uint32, 5
      optional :timeplayedconsecutively, :uint32, 6
      optional :time_first_played, :uint32, 10
      optional :last_time_played, :uint32, 12
      optional :last_ip_address, :uint32, 13
      optional :gscookieid, :uint64, 18
      optional :uniqueid, :uint64, 19
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientVarValueNotificationInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :value_name, :string, 1
      optional :value_int, :int32, 2
      optional :server_addr, :uint32, 3
      optional :server_port, :uint32, 4
      repeated :choked_blocks, :string, 5
    end
  end
  
  struct CMsgGCCStrike15_v2_ServerVarValueNotificationInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :accountid, :uint32, 1
      repeated :viewangles, :uint32, 2
      optional :type, :uint32, 3
      repeated :userdata, :uint32, 4
    end
  end
  
  struct CMsgGCCStrike15_v2_GiftsLeaderboardRequest
    include Protobuf::Message
    
    contract_of "proto2" do
    end
  end
  
  struct CMsgGCCStrike15_v2_GiftsLeaderboardResponse
    include Protobuf::Message
    
    struct GiftLeaderboardEntry
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :accountid, :uint32, 1
        optional :gifts, :uint32, 2
      end
    end
    
    contract_of "proto2" do
      optional :servertime, :uint32, 1
      optional :time_period_seconds, :uint32, 2
      optional :total_gifts_given, :uint32, 3
      optional :total_givers, :uint32, 4
      repeated :entries, CMsgGCCStrike15_v2_GiftsLeaderboardResponse::GiftLeaderboardEntry, 5
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientSubmitSurveyVote
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :survey_id, :uint32, 1
      optional :vote, :uint32, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_Server2GCClientValidate
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :accountid, :uint32, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_GC2ClientTournamentInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eventid, :uint32, 1
      optional :stageid, :uint32, 2
      optional :game_type, :uint32, 3
      repeated :teamids, :uint32, 4
    end
  end
  
  struct CSOEconCoupon
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :entryid, :uint32, 1
      optional :defidx, :uint32, 2
      optional :expiration_date, :fixed32, 3
    end
  end
  
  struct CSOQuestProgress
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :questid, :uint32, 1
      optional :points_remaining, :uint32, 2
      optional :bonus_points, :uint32, 3
    end
  end
  
  struct CSOAccountSeasonalOperation
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :season_value, :uint32, 1
      optional :tier_unlocked, :uint32, 2
      optional :premium_tiers, :uint32, 3
      optional :mission_id, :uint32, 4
      optional :missions_completed, :uint32, 5
      optional :redeemable_balance, :uint32, 6
      optional :season_pass_time, :uint32, 7
    end
  end
  
  struct CSOAccountRecurringSubscription
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :time_next_cycle, :uint32, 1
      optional :time_initiated, :uint32, 2
    end
  end
  
  struct CSOPersonaDataPublic
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :player_level, :int32, 1
      optional :commendation, PlayerCommendationInfo, 2
      optional :elevated_state, :bool, 3
    end
  end
  
  struct CMsgGC_GlobalGame_Subscribe
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :ticket, :uint64, 1
    end
  end
  
  struct CMsgGC_GlobalGame_Unsubscribe
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :timeleft, :int32, 1
    end
  end
  
  struct CMsgGC_GlobalGame_Play
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :ticket, :uint64, 1
      optional :gametimems, :uint32, 2
      optional :msperpoint, :uint32, 3
    end
  end
  
  struct CMsgGCCStrike15_v2_AcknowledgePenalty
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :acknowledged, :int32, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_Client2GCRequestPrestigeCoin
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :defindex, :uint32, 1
      optional :upgradeid, :uint64, 2
      optional :hours, :uint32, 3
      optional :prestigetime, :uint32, 4
    end
  end
  
  struct CMsgGCCStrike15_v2_Client2GCStreamUnlock
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :ticket, :uint64, 1
      optional :os, :int32, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientToGCRequestElevate
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :stage, :uint32, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientToGCChat
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :match_id, :uint64, 1
      optional :text, :string, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_GCToClientChat
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :account_id, :uint32, 1
      optional :text, :string, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientAuthKeyCode
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eventid, :uint32, 1
      optional :code, :string, 2
    end
  end
  
  struct CMsgGCCStrike15_GotvSyncPacket
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :data, CEngineGotvSyncPacket, 1
    end
  end
  
  struct PlayerDecalDigitalSignature
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :signature, :bytes, 1
      optional :accountid, :uint32, 2
      optional :rtime, :uint32, 3
      repeated :endpos, :float, 4
      repeated :startpos, :float, 5
      repeated :right, :float, 6
      optional :tx_defidx, :uint32, 7
      optional :entindex, :int32, 8
      optional :hitbox, :uint32, 9
      optional :creationtime, :float, 10
      optional :equipslot, :uint32, 11
      optional :trace_id, :uint32, 12
      repeated :normal, :float, 13
      optional :tint_id, :uint32, 14
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientPlayerDecalSign
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :data, PlayerDecalDigitalSignature, 1
      optional :itemid, :uint64, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientLogonFatalError
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :errorcode, :uint32, 1
      optional :message, :string, 2
      optional :country, :string, 3
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientPollState
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :pollid, :uint32, 1
      repeated :names, :string, 2
      repeated :values, :int32, 3
    end
  end
  
  struct CMsgGCCStrike15_v2_Party_Register
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :id, :uint32, 1
      optional :ver, :uint32, 2
      optional :apr, :uint32, 3
      optional :ark, :uint32, 4
      optional :nby, :uint32, 5
      optional :grp, :uint32, 6
      optional :slots, :uint32, 7
      optional :launcher, :uint32, 8
      optional :game_type, :uint32, 9
    end
  end
  
  struct CMsgGCCStrike15_v2_Party_Search
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :ver, :uint32, 1
      optional :apr, :uint32, 2
      optional :ark, :uint32, 3
      repeated :grps, :uint32, 4
      optional :launcher, :uint32, 5
      optional :game_type, :uint32, 6
    end
  end
  
  struct CMsgGCCStrike15_v2_Party_SearchResults
    include Protobuf::Message
    
    struct Entry
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :id, :uint32, 1
        optional :grp, :uint32, 2
        optional :game_type, :uint32, 3
        optional :apr, :uint32, 4
        optional :ark, :uint32, 5
        optional :loc, :uint32, 6
        optional :accountid, :uint32, 7
      end
    end
    
    contract_of "proto2" do
      repeated :entries, CMsgGCCStrike15_v2_Party_SearchResults::Entry, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_Party_Invite
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :accountid, :uint32, 1
      optional :lobbyid, :uint32, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_Account_RequestCoPlays
    include Protobuf::Message
    
    struct Player
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :accountid, :uint32, 1
        optional :rtcoplay, :uint32, 2
        optional :online, :bool, 3
      end
    end
    
    contract_of "proto2" do
      repeated :players, CMsgGCCStrike15_v2_Account_RequestCoPlays::Player, 1
      optional :servertime, :uint32, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientToGCRequestTicket
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :authorized_steam_id, :fixed64, 1
      optional :authorized_public_ip, :fixed32, 2
      optional :gameserver_steam_id, :fixed64, 3
      optional :gameserver_sdr_routing, :string, 5
    end
  end
  
  struct CMsgGCToClientSteamDatagramTicket
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :serialized_ticket, :bytes, 16
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientRequestOffers
    include Protobuf::Message
    
    contract_of "proto2" do
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientRequestSouvenir
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :itemid, :uint64, 1
      optional :matchid, :uint64, 2
      optional :eventid, :int32, 3
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientAccountBalance
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :amount, :uint64, 1
      optional :url, :string, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientPartyJoinRelay
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :accountid, :uint32, 1
      optional :lobbyid, :uint64, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientPartyWarning
    include Protobuf::Message
    
    struct Entry
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :accountid, :uint32, 1
        optional :warntype, :uint32, 2
      end
    end
    
    contract_of "proto2" do
      repeated :entries, CMsgGCCStrike15_v2_ClientPartyWarning::Entry, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_SetEventFavorite
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eventid, :uint64, 1
      optional :is_favorite, :bool, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_GetEventFavorites_Request
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :all_events, :bool, 1
    end
  end
  
  struct CMsgGCCStrike15_v2_GetEventFavorites_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :all_events, :bool, 1
      optional :json_favorites, :string, 2
      optional :json_featured, :string, 3
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientPerfReport
    include Protobuf::Message
    
    struct Entry
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :perfcounter, :uint32, 1
        optional :length, :uint32, 2
        optional :reference, :bytes, 3
        optional :actual, :bytes, 4
        optional :sourceid, :uint32, 5
        optional :status, :uint32, 6
      end
    end
    
    contract_of "proto2" do
      repeated :entries, CMsgGCCStrike15_v2_ClientPerfReport::Entry, 1
    end
  end
  
  struct CVDiagnostic
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :id, :uint32, 1
      optional :extended, :uint32, 2
      optional :value, :uint64, 3
      optional :string_value, :string, 4
    end
  end
  
  struct CMsgGCCStrike15_v2_ClientReportValidation
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :file_report, :string, 1
      optional :command_line, :string, 2
      optional :total_files, :uint32, 3
      optional :internal_error, :uint32, 4
      optional :trust_time, :uint32, 5
      optional :count_pending, :uint32, 6
      optional :count_completed, :uint32, 7
      optional :process_id, :uint32, 8
      optional :osversion, :int32, 9
      optional :clientreportversion, :uint32, 10
      optional :status_id, :uint32, 11
      optional :diagnostic1, :uint32, 12
      optional :diagnostic2, :uint64, 13
      optional :diagnostic3, :uint64, 14
      optional :last_launch_data, :string, 15
      optional :report_count, :uint32, 16
      optional :client_time, :uint64, 17
      optional :diagnostic4, :uint64, 18
      optional :diagnostic5, :uint64, 19
      repeated :diagnostics, CVDiagnostic, 20
    end
  end
  
  struct CMsgGCCStrike15_v2_GC2ClientRefuseSecureMode
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :file_report, :string, 1
      optional :offer_insecure_mode, :bool, 2
      optional :offer_secure_mode, :bool, 3
      optional :show_unsigned_ui, :bool, 4
      optional :kick_user, :bool, 5
      optional :show_trusted_ui, :bool, 6
      optional :show_warning_not_trusted, :bool, 7
      optional :show_warning_not_trusted_2, :bool, 8
      optional :files_prevented_trusted, :string, 9
    end
  end
  
  struct CMsgGCCStrike15_v2_GC2ClientRequestValidation
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :full_report, :bool, 1
      optional :module, :string, 2
    end
  end
  
  struct CMsgGCCStrike15_v2_GC2ClientInitSystem
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :load, :bool, 1
      optional :name, :string, 2
      optional :outputname, :string, 3
      optional :key_data, :bytes, 4
      optional :sha_hash, :bytes, 5
      optional :cookie, :int32, 6
      optional :manifest, :string, 7
      optional :system_package, :bytes, 8
      optional :load_system, :bool, 9
    end
  end
  
  struct CMsgGCCStrike15_v2_GC2ClientInitSystem_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :success, :bool, 1
      optional :diagnostic, :string, 2
      optional :sha_hash, :bytes, 3
      optional :response, :int32, 4
      optional :error_code1, :int32, 5
      optional :error_code2, :int32, 6
      optional :handle, :int64, 7
      optional :einit_result, EInitSystemResult, 8, default: EInitSystemResult::KEInitSystemResultInvalid
      optional :aux_system1, :int32, 9
      optional :aux_system2, :int32, 10
    end
  end
  end
