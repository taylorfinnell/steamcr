# # Generated from gcsdk_gcmessages.proto
require "protobuf"

module Csgo
  enum GCClientLauncherType
    GCClientLauncherTypeDEFAULT      = 0
    GCClientLauncherTypePERFECTWORLD = 1
  end
  enum GCConnectionStatus
    GCConnectionStatusHAVESESSION           = 0
    GCConnectionStatusGCGOINGDOWN           = 1
    GCConnectionStatusNOSESSION             = 2
    GCConnectionStatusNOSESSIONINLOGONQUEUE = 3
    GCConnectionStatusNOSTEAM               = 4
  end
  enum ESteamPaymentRuleType
    KEPaymentRuleTypeComposite       = 0
    KEPaymentRuleTypeWorkshop        = 1
    KEPaymentRuleTypeServiceProvider = 2
    KEPaymentRuleTypePartner         = 3
    KEPaymentRuleTypeSpecialPayment  = 4
  end

  struct CMsgSOIDOwner
    include Protobuf::Message

    contract_of "proto2" do
      optional :type, :uint32, 1
      optional :id, :uint64, 2
    end
  end

  struct CMsgSOSingleObject
    include Protobuf::Message

    contract_of "proto2" do
      optional :type_id, :int32, 2
      optional :object_data, :bytes, 3
      optional :version, :fixed64, 4
      optional :owner_soid, CMsgSOIDOwner, 5
    end
  end

  struct CMsgSOMultipleObjects
    include Protobuf::Message

    struct SingleObject
      include Protobuf::Message

      contract_of "proto2" do
        optional :type_id, :int32, 1
        optional :object_data, :bytes, 2
      end
    end

    contract_of "proto2" do
      repeated :objects_modified, CMsgSOMultipleObjects::SingleObject, 2
      optional :version, :fixed64, 3
      optional :owner_soid, CMsgSOIDOwner, 6
    end
  end

  struct CMsgSOCacheSubscribed
    include Protobuf::Message

    struct SubscribedType
      include Protobuf::Message

      contract_of "proto2" do
        optional :type_id, :int32, 1
        repeated :object_data, :bytes, 2
      end
    end

    contract_of "proto2" do
      repeated :objects, CMsgSOCacheSubscribed::SubscribedType, 2
      optional :version, :fixed64, 3
      optional :owner_soid, CMsgSOIDOwner, 4
    end
  end

  struct CMsgSOCacheUnsubscribed
    include Protobuf::Message

    contract_of "proto2" do
      optional :owner_soid, CMsgSOIDOwner, 2
    end
  end

  struct CMsgSOCacheSubscriptionCheck
    include Protobuf::Message

    contract_of "proto2" do
      optional :version, :fixed64, 2
      optional :owner_soid, CMsgSOIDOwner, 3
    end
  end

  struct CMsgSOCacheSubscriptionRefresh
    include Protobuf::Message

    contract_of "proto2" do
      optional :owner_soid, CMsgSOIDOwner, 2
    end
  end

  struct CMsgSOCacheVersion
    include Protobuf::Message

    contract_of "proto2" do
      optional :version, :fixed64, 1
    end
  end

  struct CMsgAccountDetails
    include Protobuf::Message

    contract_of "proto2" do
      optional :valid, :bool, 1
      optional :account_name, :string, 2
      optional :public_profile, :bool, 4
      optional :public_inventory, :bool, 5
      optional :vac_banned, :bool, 6
      optional :cyber_cafe, :bool, 7
      optional :school_account, :bool, 8
      optional :free_trial_account, :bool, 9
      optional :subscribed, :bool, 10
      optional :low_violence, :bool, 11
      optional :limited, :bool, 12
      optional :trusted, :bool, 13
      optional :package, :uint32, 14
      optional :time_cached, :fixed32, 15
      optional :account_locked, :bool, 16
      optional :community_banned, :bool, 17
      optional :trade_banned, :bool, 18
      optional :eligible_for_community_market, :bool, 19
    end
  end

  struct CMsgGCMultiplexMessage
    include Protobuf::Message

    contract_of "proto2" do
      optional :msgtype, :uint32, 1
      optional :payload, :bytes, 2
      repeated :steamids, :fixed64, 3
      optional :replytogc, :bool, 4
    end
  end

  struct CMsgGCMultiplexMessage_Response
    include Protobuf::Message

    contract_of "proto2" do
      optional :msgtype, :uint32, 1
    end
  end

  struct CGCToGCMsgMasterAck
    include Protobuf::Message

    contract_of "proto2" do
      optional :dir_index, :uint32, 1
      optional :gc_type, :uint32, 2
    end
  end

  struct CGCToGCMsgMasterAck_Response
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
    end
  end

  struct CGCToGCMsgMasterStartupComplete
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CGCToGCMsgRouted
    include Protobuf::Message

    contract_of "proto2" do
      optional :msg_type, :uint32, 1
      optional :sender_id, :fixed64, 2
      optional :net_message, :bytes, 3
      optional :ip, :uint32, 4
    end
  end

  struct CGCToGCMsgRoutedReply
    include Protobuf::Message

    contract_of "proto2" do
      optional :msg_type, :uint32, 1
      optional :net_message, :bytes, 2
    end
  end

  struct CMsgGCUpdateSessionIP
    include Protobuf::Message

    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :ip, :fixed32, 2
    end
  end

  struct CMsgGCRequestSessionIP
    include Protobuf::Message

    contract_of "proto2" do
      optional :steamid, :fixed64, 1
    end
  end

  struct CMsgGCRequestSessionIPResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :ip, :fixed32, 1
    end
  end

  struct CMsgSOCacheHaveVersion
    include Protobuf::Message

    contract_of "proto2" do
      optional :soid, CMsgSOIDOwner, 1
      optional :version, :fixed64, 2
    end
  end

  struct CMsgClientHello
    include Protobuf::Message

    contract_of "proto2" do
      optional :version, :uint32, 1
      repeated :socache_have_versions, CMsgSOCacheHaveVersion, 2
      optional :client_session_need, :uint32, 3
      optional :client_launcher, :uint32, 4
      optional :partner_srcid, :uint32, 5
      optional :partner_accountid, :uint32, 6
      optional :partner_accountflags, :uint32, 7
      optional :partner_accountbalance, :uint32, 8
      optional :steam_launcher, :uint32, 9
    end
  end

  struct CMsgServerHello
    include Protobuf::Message

    contract_of "proto2" do
      optional :version, :uint32, 1
      repeated :socache_have_versions, CMsgSOCacheHaveVersion, 2
      optional :legacy_client_session_need, :uint32, 3
      optional :client_launcher, :uint32, 4
      optional :legacy_steamdatagram_routing, :bytes, 6
      optional :required_internal_addr, :uint32, 7
      optional :steamdatagram_login, :bytes, 8
    end
  end

  struct CMsgClientWelcome
    include Protobuf::Message

    struct Location
      include Protobuf::Message

      contract_of "proto2" do
        optional :latitude, :float, 1
        optional :longitude, :float, 2
        optional :country, :string, 3
      end
    end

    contract_of "proto2" do
      optional :version, :uint32, 1
      optional :game_data, :bytes, 2
      repeated :outofdate_subscribed_caches, CMsgSOCacheSubscribed, 3
      repeated :uptodate_subscribed_caches, CMsgSOCacheSubscriptionCheck, 4
      optional :location, CMsgClientWelcome::Location, 5
      optional :game_data2, :bytes, 6
      optional :rtime32_gc_welcome_timestamp, :uint32, 7
      optional :currency, :uint32, 8
      optional :balance, :uint32, 9
      optional :balance_url, :string, 10
      optional :txn_country_code, :string, 11
    end
  end

  struct CMsgConnectionStatus
    include Protobuf::Message

    contract_of "proto2" do
      optional :status, GCConnectionStatus, 1, default: GCConnectionStatus::GCConnectionStatusHAVESESSION
      optional :client_session_need, :uint32, 2
      optional :queue_position, :int32, 3
      optional :queue_size, :int32, 4
      optional :wait_seconds, :int32, 5
      optional :estimated_wait_seconds_remaining, :int32, 6
    end
  end

  struct CWorkshop_PopulateItemDescriptions_Request
    include Protobuf::Message

    struct SingleItemDescription
      include Protobuf::Message

      contract_of "proto2" do
        optional :gameitemid, :uint32, 1
        optional :item_description, :string, 2
        optional :one_per_account, :bool, 3
      end
    end

    struct ItemDescriptionsLanguageBlock
      include Protobuf::Message

      contract_of "proto2" do
        optional :language, :string, 1
        repeated :descriptions, CWorkshop_PopulateItemDescriptions_Request::SingleItemDescription, 2
      end
    end

    contract_of "proto2" do
      optional :appid, :uint32, 1
      repeated :languages, CWorkshop_PopulateItemDescriptions_Request::ItemDescriptionsLanguageBlock, 2
    end
  end

  struct CWorkshop_GetContributors_Request
    include Protobuf::Message

    contract_of "proto2" do
      optional :appid, :uint32, 1
      optional :gameitemid, :uint32, 2
    end
  end

  struct CWorkshop_GetContributors_Response
    include Protobuf::Message

    contract_of "proto2" do
      repeated :contributors, :fixed64, 1
    end
  end

  struct CWorkshop_SetItemPaymentRules_Request
    include Protobuf::Message

    struct WorkshopItemPaymentRule
      include Protobuf::Message

      contract_of "proto2" do
        optional :workshop_file_id, :uint64, 1
        optional :revenue_percentage, :float, 2
        optional :rule_description, :string, 3
        optional :rule_type, :uint32, 4, default: 1_u32
      end
    end

    struct PartnerItemPaymentRule
      include Protobuf::Message

      contract_of "proto2" do
        optional :account_id, :uint32, 1
        optional :revenue_percentage, :float, 2
        optional :rule_description, :string, 3
      end
    end

    contract_of "proto2" do
      optional :appid, :uint32, 1
      optional :gameitemid, :uint32, 2
      repeated :associated_workshop_files, CWorkshop_SetItemPaymentRules_Request::WorkshopItemPaymentRule, 3
      repeated :partner_accounts, CWorkshop_SetItemPaymentRules_Request::PartnerItemPaymentRule, 4
    end
  end

  struct CWorkshop_SetItemPaymentRules_Response
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CGameServers_AggregationQuery_Request
    include Protobuf::Message

    contract_of "proto2" do
      optional :filter, :string, 1
      repeated :group_fields, :string, 3
    end
  end

  struct CGameServers_AggregationQuery_Response
    include Protobuf::Message

    struct Group
      include Protobuf::Message

      contract_of "proto2" do
        repeated :group_values, :string, 1
        optional :servers_empty, :uint32, 2
        optional :servers_full, :uint32, 3
        optional :servers_total, :uint32, 4
        optional :players_humans, :uint32, 5
        optional :players_bots, :uint32, 6
        optional :player_capacity, :uint32, 7
      end
    end

    contract_of "proto2" do
      repeated :groups, CGameServers_AggregationQuery_Response::Group, 1
    end
  end

  struct CWorkshop_AddSpecialPayment_Request
    include Protobuf::Message

    contract_of "proto2" do
      optional :appid, :uint32, 1
      optional :gameitemid, :uint32, 2
      optional :date, :string, 3
      optional :payment_us_usd, :uint64, 4
      optional :payment_row_usd, :uint64, 5
    end
  end

  struct CWorkshop_AddSpecialPayment_Response
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CProductInfo_SetRichPresenceLocalization_Request
    include Protobuf::Message

    struct Token
      include Protobuf::Message

      contract_of "proto2" do
        optional :token, :string, 1
        optional :value, :string, 2
      end
    end

    struct LanguageSection
      include Protobuf::Message

      contract_of "proto2" do
        optional :language, :string, 1
        repeated :tokens, CProductInfo_SetRichPresenceLocalization_Request::Token, 2
      end
    end

    contract_of "proto2" do
      optional :appid, :uint32, 1
      repeated :languages, CProductInfo_SetRichPresenceLocalization_Request::LanguageSection, 2
      optional :steamid, :uint64, 3
    end
  end

  struct CProductInfo_SetRichPresenceLocalization_Response
    include Protobuf::Message

    contract_of "proto2" do
    end
  end
end
