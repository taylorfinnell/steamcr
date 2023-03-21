## Generated from steammessages.proto
require "protobuf"

module Csgo
  enum GCProtoBufMsgSrc
    GCProtoBufMsgSrcUnspecified = 0
    GCProtoBufMsgSrcFromSystem = 1
    GCProtoBufMsgSrcFromSteamID = 2
    GCProtoBufMsgSrcFromGC = 3
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
  
  struct CMsgWebAPIKey
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :status, :uint32, 1, default: 255_u32
      optional :account_id, :uint32, 2, default: 0_u32
      optional :publisher_group_id, :uint32, 3, default: 0_u32
      optional :key_id, :uint32, 4
      optional :domain, :string, 5
    end
  end
  
  struct CMsgHttpRequest
    include Protobuf::Message
    
    struct RequestHeader
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :name, :string, 1
        optional :value, :string, 2
      end
    end
    
    struct QueryParam
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :name, :string, 1
        optional :value, :bytes, 2
      end
    end
    
    contract_of "proto2" do
      optional :request_method, :uint32, 1
      optional :hostname, :string, 2
      optional :url, :string, 3
      repeated :headers, CMsgHttpRequest::RequestHeader, 4
      repeated :get_params, CMsgHttpRequest::QueryParam, 5
      repeated :post_params, CMsgHttpRequest::QueryParam, 6
      optional :body, :bytes, 7
      optional :absolute_timeout, :uint32, 8
    end
  end
  
  struct CMsgWebAPIRequest
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :unused_job_name, :string, 1
      optional :interface_name, :string, 2
      optional :method_name, :string, 3
      optional :version, :uint32, 4
      optional :api_key, CMsgWebAPIKey, 5
      optional :request, CMsgHttpRequest, 6
      optional :routing_app_id, :uint32, 7
    end
  end
  
  struct CMsgHttpResponse
    include Protobuf::Message
    
    struct ResponseHeader
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :name, :string, 1
        optional :value, :string, 2
      end
    end
    
    contract_of "proto2" do
      optional :status_code, :uint32, 1
      repeated :headers, CMsgHttpResponse::ResponseHeader, 2
      optional :body, :bytes, 3
    end
  end
  
  struct CMsgAMFindAccounts
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :search_type, :uint32, 1
      optional :search_string, :string, 2
    end
  end
  
  struct CMsgAMFindAccountsResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :steam_id, :fixed64, 1
    end
  end
  
  struct CMsgNotifyWatchdog
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :source, :uint32, 1
      optional :alert_type, :uint32, 2
      optional :alert_destination, :uint32, 3
      optional :critical, :bool, 4
      optional :time, :uint32, 5
      optional :appid, :uint32, 6
      optional :text, :string, 7
    end
  end
  
  struct CMsgAMGetLicenses
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
    end
  end
  
  struct CMsgPackageLicense
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :package_id, :uint32, 1
      optional :time_created, :uint32, 2
      optional :owner_id, :uint32, 3
    end
  end
  
  struct CMsgAMGetLicensesResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :license, CMsgPackageLicense, 1
      optional :result, :uint32, 2
    end
  end
  
  struct CMsgAMGetUserGameStats
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
      optional :game_id, :fixed64, 2
      repeated :stats, :uint32, 3
    end
  end
  
  struct CMsgAMGetUserGameStatsResponse
    include Protobuf::Message
    
    struct Stats
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :stat_id, :uint32, 1
        optional :stat_value, :uint32, 2
      end
    end
    
    struct Achievement_Blocks
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :achievement_id, :uint32, 1
        optional :achievement_bit_id, :uint32, 2
        optional :unlock_time, :fixed32, 3
      end
    end
    
    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
      optional :game_id, :fixed64, 2
      optional :eresult, :int32, 3, default: 2
      repeated :stats, CMsgAMGetUserGameStatsResponse::Stats, 4
      repeated :achievement_blocks, CMsgAMGetUserGameStatsResponse::Achievement_Blocks, 5
    end
  end
  
  struct CMsgGCGetCommandList
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :command_prefix, :string, 2
    end
  end
  
  struct CMsgGCGetCommandListResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :command_name, :string, 1
    end
  end
  
  struct CGCMsgMemCachedGet
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :keys, :string, 1
    end
  end
  
  struct CGCMsgMemCachedGetResponse
    include Protobuf::Message
    
    struct ValueTag
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :found, :bool, 1
        optional :value, :bytes, 2
      end
    end
    
    contract_of "proto2" do
      repeated :values, CGCMsgMemCachedGetResponse::ValueTag, 1
    end
  end
  
  struct CGCMsgMemCachedSet
    include Protobuf::Message
    
    struct KeyPair
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :name, :string, 1
        optional :value, :bytes, 2
      end
    end
    
    contract_of "proto2" do
      repeated :keys, CGCMsgMemCachedSet::KeyPair, 1
    end
  end
  
  struct CGCMsgMemCachedDelete
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :keys, :string, 1
    end
  end
  
  struct CGCMsgMemCachedStats
    include Protobuf::Message
    
    contract_of "proto2" do
    end
  end
  
  struct CGCMsgMemCachedStatsResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :curr_connections, :uint64, 1
      optional :cmd_get, :uint64, 2
      optional :cmd_set, :uint64, 3
      optional :cmd_flush, :uint64, 4
      optional :get_hits, :uint64, 5
      optional :get_misses, :uint64, 6
      optional :delete_hits, :uint64, 7
      optional :delete_misses, :uint64, 8
      optional :bytes_read, :uint64, 9
      optional :bytes_written, :uint64, 10
      optional :limit_maxbytes, :uint64, 11
      optional :curr_items, :uint64, 12
      optional :evictions, :uint64, 13
      optional :bytes, :uint64, 14
    end
  end
  
  struct CGCMsgSQLStats
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :schema_catalog, :uint32, 1
    end
  end
  
  struct CGCMsgSQLStatsResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :threads, :uint32, 1
      optional :threads_connected, :uint32, 2
      optional :threads_active, :uint32, 3
      optional :operations_submitted, :uint32, 4
      optional :prepared_statements_executed, :uint32, 5
      optional :non_prepared_statements_executed, :uint32, 6
      optional :deadlock_retries, :uint32, 7
      optional :operations_timed_out_in_queue, :uint32, 8
      optional :errors, :uint32, 9
    end
  end
  
  struct CMsgAMAddFreeLicense
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :ip_public, :uint32, 2
      optional :packageid, :uint32, 3
      optional :store_country_code, :string, 4
    end
  end
  
  struct CMsgAMAddFreeLicenseResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :purchase_result_detail, :int32, 2
      optional :transid, :fixed64, 3
    end
  end
  
  struct CGCMsgGetIPLocation
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :ips, :fixed32, 1
    end
  end
  
  struct CIPLocationInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :ip, :uint32, 1
      optional :latitude, :float, 2
      optional :longitude, :float, 3
      optional :country, :string, 4
      optional :state, :string, 5
      optional :city, :string, 6
    end
  end
  
  struct CGCMsgGetIPLocationResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :infos, CIPLocationInfo, 1
    end
  end
  
  struct CGCMsgSystemStatsSchema
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :gc_app_id, :uint32, 1
      optional :schema_kv, :bytes, 2
    end
  end
  
  struct CGCMsgGetSystemStats
    include Protobuf::Message
    
    contract_of "proto2" do
    end
  end
  
  struct CGCMsgGetSystemStatsResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :gc_app_id, :uint32, 1
      optional :stats_kv, :bytes, 2
      optional :active_jobs, :uint32, 3
      optional :yielding_jobs, :uint32, 4
      optional :user_sessions, :uint32, 5
      optional :game_server_sessions, :uint32, 6
      optional :socaches, :uint32, 7
      optional :socaches_to_unload, :uint32, 8
      optional :socaches_loading, :uint32, 9
      optional :writeback_queue, :uint32, 10
      optional :steamid_locks, :uint32, 11
      optional :logon_queue, :uint32, 12
      optional :logon_jobs, :uint32, 13
    end
  end
  
  struct CMsgAMSendEmail
    include Protobuf::Message
    
    struct ReplacementToken
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :token_name, :string, 1
        optional :token_value, :string, 2
      end
    end
    
    struct PersonaNameReplacementToken
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :steamid, :fixed64, 1
        optional :token_name, :string, 2
      end
    end
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :email_msg_type, :uint32, 2
      optional :email_format, :uint32, 3
      repeated :persona_name_tokens, CMsgAMSendEmail::PersonaNameReplacementToken, 5
      optional :source_gc, :uint32, 6
      repeated :tokens, CMsgAMSendEmail::ReplacementToken, 7
    end
  end
  
  struct CMsgAMSendEmailResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :uint32, 1, default: 2_u32
    end
  end
  
  struct CMsgGCGetEmailTemplate
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :email_msg_type, :uint32, 2
      optional :email_lang, :int32, 3
      optional :email_format, :int32, 4
    end
  end
  
  struct CMsgGCGetEmailTemplateResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :uint32, 1, default: 2_u32
      optional :template_exists, :bool, 2
      optional :template, :string, 3
    end
  end
  
  struct CMsgAMGrantGuestPasses2
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
      optional :package_id, :uint32, 2
      optional :passes_to_grant, :int32, 3
      optional :days_to_expiration, :int32, 4
      optional :action, :int32, 5
    end
  end
  
  struct CMsgAMGrantGuestPasses2Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :passes_granted, :int32, 2, default: 0
    end
  end
  
  struct CGCSystemMsg_GetAccountDetails
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :appid, :uint32, 2
    end
  end
  
  struct CGCSystemMsg_GetAccountDetails_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult_deprecated, :uint32, 1, default: 2_u32
      optional :account_name, :string, 2
      optional :persona_name, :string, 3
      optional :is_profile_public, :bool, 4
      optional :is_inventory_public, :bool, 5
      optional :is_vac_banned, :bool, 7
      optional :is_cyber_cafe, :bool, 8
      optional :is_school_account, :bool, 9
      optional :is_limited, :bool, 10
      optional :is_subscribed, :bool, 11
      optional :package, :uint32, 12
      optional :is_free_trial_account, :bool, 13
      optional :free_trial_expiration, :uint32, 14
      optional :is_low_violence, :bool, 15
      optional :is_account_locked_down, :bool, 16
      optional :is_community_banned, :bool, 17
      optional :is_trade_banned, :bool, 18
      optional :trade_ban_expiration, :uint32, 19
      optional :accountid, :uint32, 20
      optional :suspension_end_time, :uint32, 21
      optional :currency, :string, 22
      optional :steam_level, :uint32, 23
      optional :friend_count, :uint32, 24
      optional :account_creation_time, :uint32, 25
      optional :is_steamguard_enabled, :bool, 27
      optional :is_phone_verified, :bool, 28
      optional :is_two_factor_auth_enabled, :bool, 29
      optional :two_factor_enabled_time, :uint32, 30
      optional :phone_verification_time, :uint32, 31
      optional :phone_id, :uint64, 33
      optional :is_phone_identifying, :bool, 34
      optional :rt_identity_linked, :uint32, 35
      optional :rt_birth_date, :uint32, 36
      optional :txn_country_code, :string, 37
      optional :has_accepted_china_ssa, :bool, 38
      optional :is_banned_steam_china, :bool, 39
    end
  end
  
  struct CMsgGCGetPersonaNames
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :steamids, :fixed64, 1
    end
  end
  
  struct CMsgGCGetPersonaNames_Response
    include Protobuf::Message
    
    struct PersonaName
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :steamid, :fixed64, 1
        optional :persona_name, :string, 2
      end
    end
    
    contract_of "proto2" do
      repeated :succeeded_lookups, CMsgGCGetPersonaNames_Response::PersonaName, 1
      repeated :failed_lookup_steamids, :fixed64, 2
    end
  end
  
  struct CMsgGCCheckFriendship
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid_left, :fixed64, 1
      optional :steamid_right, :fixed64, 2
    end
  end
  
  struct CMsgGCCheckFriendship_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :success, :bool, 1
      optional :found_friendship, :bool, 2
    end
  end
  
  struct CMsgGCMsgMasterSetDirectory
    include Protobuf::Message
    
    struct SubGC
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :dir_index, :uint32, 1
        optional :name, :string, 2
        optional :box, :string, 3
        optional :command_line, :string, 4
        optional :gc_binary, :string, 5
      end
    end
    
    contract_of "proto2" do
      optional :master_dir_index, :uint32, 1
      repeated :dir, CMsgGCMsgMasterSetDirectory::SubGC, 2
    end
  end
  
  struct CMsgGCMsgMasterSetDirectory_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :message, :string, 2
    end
  end
  
  struct CMsgGCMsgWebAPIJobRequestForwardResponse
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :dir_index, :uint32, 1
    end
  end
  
  struct CGCSystemMsg_GetPurchaseTrust_Request
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
    end
  end
  
  struct CGCSystemMsg_GetPurchaseTrust_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :has_prior_purchase_history, :bool, 1
      optional :has_no_recent_password_resets, :bool, 2
      optional :is_wallet_cash_trusted, :bool, 3
      optional :time_all_trusted, :uint32, 4
    end
  end
  
  struct CMsgGCHAccountVacStatusChange
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
      optional :app_id, :uint32, 2
      optional :rtime_vacban_starts, :uint32, 3
      optional :is_banned_now, :bool, 4
      optional :is_banned_future, :bool, 5
    end
  end
  
  struct CMsgGCGetPartnerAccountLink
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
    end
  end
  
  struct CMsgGCGetPartnerAccountLink_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :pwid, :uint32, 1
      optional :nexonid, :uint32, 2
      optional :ageclass, :int32, 3
      optional :id_verified, :bool, 4, default: true
      optional :is_adult, :bool, 5
    end
  end
  
  struct CMsgGCRoutingInfo
    include Protobuf::Message
    enum RoutingMethod
      RANDOM = 0
      DISCARD = 1
      CLIENTSTEAMID = 2
      PROTOBUFFIELDUINT64 = 3
      WEBAPIPARAMUINT64 = 4
    end
    
    contract_of "proto2" do
      repeated :dir_index, :uint32, 1
      optional :method, CMsgGCRoutingInfo::RoutingMethod, 2, default: CMsgGCRoutingInfo::RoutingMethod::RANDOM
      optional :fallback, CMsgGCRoutingInfo::RoutingMethod, 3, default: CMsgGCRoutingInfo::RoutingMethod::DISCARD
      optional :protobuf_field, :uint32, 4
      optional :webapi_param, :string, 5
    end
  end
  
  struct CMsgGCMsgMasterSetWebAPIRouting
    include Protobuf::Message
    
    struct Entry
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :interface_name, :string, 1
        optional :method_name, :string, 2
        optional :routing, CMsgGCRoutingInfo, 3
      end
    end
    
    contract_of "proto2" do
      repeated :entries, CMsgGCMsgMasterSetWebAPIRouting::Entry, 1
    end
  end
  
  struct CMsgGCMsgMasterSetClientMsgRouting
    include Protobuf::Message
    
    struct Entry
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :msg_type, :uint32, 1
        optional :routing, CMsgGCRoutingInfo, 2
      end
    end
    
    contract_of "proto2" do
      repeated :entries, CMsgGCMsgMasterSetClientMsgRouting::Entry, 1
    end
  end
  
  struct CMsgGCMsgMasterSetWebAPIRouting_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
    end
  end
  
  struct CMsgGCMsgMasterSetClientMsgRouting_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
    end
  end
  
  struct CMsgGCMsgSetOptions
    include Protobuf::Message
    enum Option
      NOTIFYUSERSESSIONS = 0
      NOTIFYSERVERSESSIONS = 1
      NOTIFYACHIEVEMENTS = 2
      NOTIFYVACACTION = 3
    end
    
    struct MessageRange
      include Protobuf::Message
      
      contract_of "proto2" do
        required :low, :uint32, 1
        required :high, :uint32, 2
      end
    end
    
    contract_of "proto2" do
      repeated :options, CMsgGCMsgSetOptions::Option, 1
      repeated :client_msg_ranges, CMsgGCMsgSetOptions::MessageRange, 2
    end
  end
  
  struct CMsgGCHUpdateSession
    include Protobuf::Message
    
    struct ExtraField
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :name, :string, 1
        optional :value, :string, 2
      end
    end
    
    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
      optional :app_id, :uint32, 2
      optional :online, :bool, 3
      optional :server_steam_id, :fixed64, 4
      optional :server_addr, :uint32, 5
      optional :server_port, :uint32, 6
      optional :os_type, :uint32, 7
      optional :client_addr, :uint32, 8
      repeated :extra_fields, CMsgGCHUpdateSession::ExtraField, 9
      optional :owner_id, :fixed64, 10
      optional :cm_session_sysid, :uint32, 11
      optional :cm_session_identifier, :uint32, 12
      repeated :depot_ids, :uint32, 13
    end
  end
  
  struct CMsgNotificationOfSuspiciousActivity
    include Protobuf::Message
    
    struct MultipleGameInstances
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :app_instance_count, :uint32, 1
        repeated :other_steamids, :fixed64, 2
      end
    end
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :appid, :uint32, 2
      optional :multiple_instances, CMsgNotificationOfSuspiciousActivity::MultipleGameInstances, 3
    end
  end
  
  struct CMsgDPPartnerMicroTxns
    include Protobuf::Message
    
    struct PartnerMicroTxn
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :init_time, :uint32, 1
        optional :last_update_time, :uint32, 2
        optional :txn_id, :uint64, 3
        optional :account_id, :uint32, 4
        optional :line_item, :uint32, 5
        optional :item_id, :uint64, 6
        optional :def_index, :uint32, 7
        optional :price, :uint64, 8
        optional :tax, :uint64, 9
        optional :price_usd, :uint64, 10
        optional :tax_usd, :uint64, 11
        optional :purchase_type, :uint32, 12
        optional :steam_txn_type, :uint32, 13
        optional :country_code, :string, 14
        optional :region_code, :string, 15
        optional :quantity, :int32, 16
        optional :ref_trans_id, :uint64, 17
      end
    end
    
    struct PartnerInfo
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :partner_id, :uint32, 1
        optional :partner_name, :string, 2
        optional :currency_code, :string, 3
        optional :currency_name, :string, 4
      end
    end
    
    contract_of "proto2" do
      optional :appid, :uint32, 1
      optional :gc_name, :string, 2
      optional :partner, CMsgDPPartnerMicroTxns::PartnerInfo, 3
      repeated :transactions, CMsgDPPartnerMicroTxns::PartnerMicroTxn, 4
    end
  end
  
  struct CMsgDPPartnerMicroTxnsResponse
    include Protobuf::Message
    enum EErrorCode
      KMsgValid = 0
      KMsgInvalidAppID = 1
      KMsgInvalidPartnerInfo = 2
      KMsgNoTransactions = 3
      KMsgSQLFailure = 4
      KMsgPartnerInfoDiscrepancy = 5
      KMsgTransactionInsertFailed = 7
      KMsgAlreadyRunning = 8
      KMsgInvalidTransactionData = 9
    end
    
    contract_of "proto2" do
      optional :eresult, :uint32, 1, default: 2_u32
      optional :eerrorcode, CMsgDPPartnerMicroTxnsResponse::EErrorCode, 2, default: CMsgDPPartnerMicroTxnsResponse::EErrorCode::KMsgValid
    end
  end
  
  struct CChinaAgreementSessions_StartAgreementSessionInGame_Request
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :appid, :uint32, 1
      optional :steamid, :fixed64, 2
      optional :client_ipaddress, :string, 3
    end
  end
  
  struct CChinaAgreementSessions_StartAgreementSessionInGame_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :agreement_url, :string, 1
    end
  end
  end
