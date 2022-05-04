# # Generated from steammessages_base.proto
require "protobuf"

module Steam
  enum EProtoClanEventType
    KEClanOtherEvent                  =  1
    KEClanGameEvent                   =  2
    KEClanPartyEvent                  =  3
    KEClanMeetingEvent                =  4
    KEClanSpecialCauseEvent           =  5
    KEClanMusicAndArtsEvent           =  6
    KEClanSportsEvent                 =  7
    KEClanTripEvent                   =  8
    KEClanChatEvent                   =  9
    KEClanGameReleaseEvent            = 10
    KEClanBroadcastEvent              = 11
    KEClanSmallUpdateEvent            = 12
    KEClanPreAnnounceMajorUpdateEvent = 13
    KEClanMajorUpdateEvent            = 14
    KEClanDLCReleaseEvent             = 15
    KEClanFutureReleaseEvent          = 16
    KEClanESportTournamentStreamEvent = 17
    KEClanDevStreamEvent              = 18
    KEClanFamousStreamEvent           = 19
    KEClanGameSalesEvent              = 20
    KEClanGameItemSalesEvent          = 21
    KEClanInGameBonusXPEvent          = 22
    KEClanInGameLootEvent             = 23
    KEClanInGamePerksEvent            = 24
    KEClanInGameChallengeEvent        = 25
    KEClanInGameContestEvent          = 26
    KEClanIRLEvent                    = 27
    KEClanNewsEvent                   = 28
    KEClanBetaReleaseEvent            = 29
    KEClanInGameContentReleaseEvent   = 30
    KEClanFreeTrial                   = 31
    KEClanSeasonRelease               = 32
    KEClanSeasonUpdate                = 33
    KEClanCrosspostEvent              = 34
    KEClanInGameEventGeneral          = 35
  end
  enum PartnerEventNotificationType
    KEEventStart          = 0
    KEEventBroadcastStart = 1
    KEEventMatchStart     = 2
    KEEventPartnerMaxType = 3
  end

  struct CMsgIPAddress
    include Protobuf::Message

    contract_of "proto2" do
      optional :v4, :fixed32, 1
      optional :v6, :bytes, 2
    end
  end

  struct CMsgIPAddressBucket
    include Protobuf::Message

    contract_of "proto2" do
      optional :original_ip_address, CMsgIPAddress, 1
      optional :bucket, :fixed64, 2
    end
  end

  struct CMsgProtoBufHeader
    include Protobuf::Message

    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :client_sessionid, :int32, 2
      optional :routing_appid, :uint32, 3
      optional :jobid_source, :fixed64, 10, default: 18446744073709551615
      optional :jobid_target, :fixed64, 11, default: 18446744073709551615
      optional :target_job_name, :string, 12
      optional :seq_num, :int32, 24
      optional :eresult, :int32, 13, default: 2
      optional :error_message, :string, 14
      optional :auth_account_flags, :uint32, 16
      optional :token_source, :uint32, 22
      optional :admin_spoofing_user, :bool, 23
      optional :transport_error, :int32, 17, default: 1
      optional :messageid, :uint64, 18, default: 18446744073709551615_u64
      optional :publisher_group_id, :uint32, 19
      optional :sysid, :uint32, 20
      optional :trace_tag, :uint64, 21
      optional :webapi_key_id, :uint32, 25
      optional :is_from_external_source, :bool, 26
      repeated :forward_to_sysid, :uint32, 27
      optional :cm_sysid, :uint32, 28
      optional :wg_token, :string, 30
      optional :launcher_type, :uint32, 31, default: 0_u32
      optional :realm, :uint32, 32, default: 0_u32
      optional :ip, :uint32, 15
      optional :ip_v6, :bytes, 29
    end
  end

  struct CMsgMulti
    include Protobuf::Message

    contract_of "proto2" do
      optional :size_unzipped, :uint32, 1
      optional :message_body, :bytes, 2
    end
  end

  struct CMsgProtobufWrapped
    include Protobuf::Message

    contract_of "proto2" do
      optional :message_body, :bytes, 1
    end
  end

  struct CMsgAuthTicket
    include Protobuf::Message

    contract_of "proto2" do
      optional :estate, :uint32, 1
      optional :eresult, :uint32, 2, default: 2_u32
      optional :steamid, :fixed64, 3
      optional :gameid, :fixed64, 4
      optional :h_steam_pipe, :uint32, 5
      optional :ticket_crc, :uint32, 6
      optional :ticket, :bytes, 7
    end
  end

  struct CCDDBAppDetailCommon
    include Protobuf::Message

    contract_of "proto2" do
      optional :appid, :uint32, 1
      optional :name, :string, 2
      optional :icon, :string, 3
      optional :logo, :string, 4
      optional :logo_small, :string, 5
      optional :tool, :bool, 6
      optional :demo, :bool, 7
      optional :media, :bool, 8
      optional :community_visible_stats, :bool, 9
      optional :friendly_name, :string, 10
      optional :propagation, :string, 11
      optional :has_adult_content, :bool, 12
    end
  end

  struct CMsgAppRights
    include Protobuf::Message

    contract_of "proto2" do
      optional :edit_info, :bool, 1
      optional :publish, :bool, 2
      optional :view_error_data, :bool, 3
      optional :download, :bool, 4
      optional :upload_cdkeys, :bool, 5
      optional :generate_cdkeys, :bool, 6
      optional :view_financials, :bool, 7
      optional :manage_ceg, :bool, 8
      optional :manage_signing, :bool, 9
      optional :manage_cdkeys, :bool, 10
      optional :edit_marketing, :bool, 11
      optional :economy_support, :bool, 12
      optional :economy_support_supervisor, :bool, 13
      optional :manage_pricing, :bool, 14
      optional :broadcast_live, :bool, 15
      optional :view_marketing_traffic, :bool, 16
    end
  end

  struct CCuratorPreferences
    include Protobuf::Message

    contract_of "proto2" do
      optional :supported_languages, :uint32, 1
      optional :platform_windows, :bool, 2
      optional :platform_mac, :bool, 3
      optional :platform_linux, :bool, 4
      optional :vr_content, :bool, 5
      optional :adult_content_violence, :bool, 6
      optional :adult_content_sex, :bool, 7
      optional :timestamp_updated, :uint32, 8
      repeated :tagids_curated, :uint32, 9
      repeated :tagids_filtered, :uint32, 10
      optional :website_title, :string, 11
      optional :website_url, :string, 12
      optional :discussion_url, :string, 13
      optional :show_broadcast, :bool, 14
    end
  end

  struct CLocalizationToken
    include Protobuf::Message

    contract_of "proto2" do
      optional :language, :uint32, 1
      optional :localized_string, :string, 2
    end
  end

  struct CClanEventUserNewsTuple
    include Protobuf::Message

    contract_of "proto2" do
      optional :clanid, :uint32, 1
      optional :event_gid, :fixed64, 2
      optional :announcement_gid, :fixed64, 3
      optional :rtime_start, :uint32, 4
      optional :rtime_end, :uint32, 5
      optional :priority_score, :uint32, 6
      optional :type, :uint32, 7
      optional :clamp_range_slot, :uint32, 8
      optional :appid, :uint32, 9
      optional :rtime32_last_modified, :uint32, 10
    end
  end

  struct CClanMatchEventByRange
    include Protobuf::Message

    contract_of "proto2" do
      optional :rtime_before, :uint32, 1
      optional :rtime_after, :uint32, 2
      optional :qualified, :uint32, 3
      repeated :events, CClanEventUserNewsTuple, 4
    end
  end

  struct CCommunity_ClanAnnouncementInfo
    include Protobuf::Message

    contract_of "proto2" do
      optional :gid, :uint64, 1
      optional :clanid, :uint64, 2
      optional :posterid, :uint64, 3
      optional :headline, :string, 4
      optional :posttime, :uint32, 5
      optional :updatetime, :uint32, 6
      optional :body, :string, 7
      optional :commentcount, :int32, 8
      repeated :tags, :string, 9
      optional :language, :int32, 10
      optional :hidden, :bool, 11
      optional :forum_topic_id, :fixed64, 12
      optional :event_gid, :fixed64, 13
      optional :voteupcount, :int32, 14
      optional :votedowncount, :int32, 15
    end
  end

  struct CClanEventData
    include Protobuf::Message

    contract_of "proto2" do
      optional :gid, :fixed64, 1
      optional :clan_steamid, :fixed64, 2
      optional :event_name, :string, 3
      optional :event_type, EProtoClanEventType, 4, default: EProtoClanEventType::KEClanOtherEvent
      optional :appid, :uint32, 5
      optional :server_address, :string, 6
      optional :server_password, :string, 7
      optional :rtime32_start_time, :uint32, 8
      optional :rtime32_end_time, :uint32, 9
      optional :comment_count, :int32, 10
      optional :creator_steamid, :fixed64, 11
      optional :last_update_steamid, :fixed64, 12
      optional :event_notes, :string, 13
      optional :jsondata, :string, 14
      # optional :announcement_body, CCommunityClanAnnouncementInfo, 15
      optional :published, :bool, 16
      optional :hidden, :bool, 17
      optional :rtime32_visibility_start, :uint32, 18
      optional :rtime32_visibility_end, :uint32, 19
      optional :broadcaster_accountid, :uint32, 20
      optional :follower_count, :uint32, 21
      optional :ignore_count, :uint32, 22
      optional :forum_topic_id, :fixed64, 23
      optional :rtime32_last_modified, :uint32, 24
      optional :news_post_gid, :fixed64, 25
      optional :rtime_mod_reviewed, :uint32, 26
    end
  end

  struct CBilling_Address
    include Protobuf::Message

    contract_of "proto2" do
      optional :first_name, :string, 1
      optional :last_name, :string, 2
      optional :address1, :string, 3
      optional :address2, :string, 4
      optional :city, :string, 5
      optional :us_state, :string, 6
      optional :country_code, :string, 7
      optional :postcode, :string, 8
      optional :zip_plus4, :int32, 9
      optional :phone, :string, 10
    end
  end
end
