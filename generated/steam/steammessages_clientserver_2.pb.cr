# # Generated from steammessages_clientserver_2.proto
require "protobuf"

module Steam
  struct CMsgClientUCMAddScreenshot
    include Protobuf::Message

    struct Tag
      include Protobuf::Message

      contract_of "proto2" do
        optional :tag_name, :string, 1
        optional :tag_value, :string, 2
      end
    end

    contract_of "proto2" do
      optional :appid, :uint32, 1
      optional :filename, :string, 2
      optional :thumbname, :string, 3
      optional :vr_filename, :string, 14
      optional :rtime32_created, :fixed32, 4
      optional :width, :uint32, 5
      optional :height, :uint32, 6
      optional :permissions, :uint32, 7
      optional :caption, :string, 8
      optional :shortcut_name, :string, 9
      repeated :tag, CMsgClientUCMAddScreenshot::Tag, 10
      repeated :tagged_steamid, :fixed64, 11
      optional :spoiler_tag, :bool, 12
      repeated :tagged_publishedfileid, :uint64, 13
    end
  end

  struct CMsgClientUCMAddScreenshotResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :screenshotid, :fixed64, 2, default: 18446744073709551615
    end
  end

  struct CMsgClientUCMDeleteScreenshot
    include Protobuf::Message

    contract_of "proto2" do
      optional :screenshotid, :fixed64, 1, default: 18446744073709551615
    end
  end

  struct CMsgClientUCMDeleteScreenshotResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
    end
  end

  struct CMsgClientUCMPublishFile
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :file_name, :string, 2
      optional :preview_file_name, :string, 3
      optional :consumer_app_id, :uint32, 4
      optional :title, :string, 5
      optional :description, :string, 6
      repeated :tags, :string, 8
      optional :workshop_file, :bool, 9
      optional :visibility, :int32, 10
      optional :file_type, :uint32, 11
      optional :url, :string, 12
      optional :video_provider, :uint32, 13
      optional :video_account_name, :string, 14
      optional :video_identifier, :string, 15
      optional :in_progress, :bool, 16
    end
  end

  struct CMsgClientUCMPublishFileResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :published_file_id, :fixed64, 2, default: 18446744073709551615
      optional :needs_workshop_legal_agreement_acceptance, :bool, 3, default: false
    end
  end

  struct CMsgClientUCMUpdatePublishedFile
    include Protobuf::Message

    struct KeyValueTag
      include Protobuf::Message

      contract_of "proto2" do
        optional :key, :string, 1
        optional :value, :string, 2
      end
    end

    struct AdditionalPreview
      include Protobuf::Message

      contract_of "proto2" do
        optional :original_file_name, :string, 1
        optional :internal_file_name, :string, 2
        optional :videoid, :string, 3
        optional :preview_type, :uint32, 4
        optional :update_index, :int32, 5, default: -1
      end
    end

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :published_file_id, :fixed64, 2
      optional :file_name, :string, 3
      optional :preview_file_name, :string, 4
      optional :title, :string, 5
      optional :description, :string, 6
      repeated :tags, :string, 7
      optional :visibility, :int32, 8
      optional :update_file, :bool, 9
      optional :update_preview_file, :bool, 10
      optional :update_title, :bool, 11
      optional :update_description, :bool, 12
      optional :update_tags, :bool, 13
      optional :update_visibility, :bool, 14
      optional :change_description, :string, 15
      optional :update_url, :bool, 16
      optional :url, :string, 17
      optional :update_content_manifest, :bool, 18
      optional :content_manifest, :fixed64, 19
      optional :metadata, :string, 20
      optional :update_metadata, :bool, 21
      optional :language, :int32, 22, default: 0
      repeated :removed_kvtags, :string, 23
      repeated :kvtags, CMsgClientUCMUpdatePublishedFile::KeyValueTag, 24
      repeated :previews, CMsgClientUCMUpdatePublishedFile::AdditionalPreview, 25
      repeated :previews_to_remove, :int32, 26
      optional :clear_in_progress, :bool, 27
      optional :remove_all_kvtags, :bool, 28
    end
  end

  struct CMsgClientUCMUpdatePublishedFileResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :needs_workshop_legal_agreement_acceptance, :bool, 2, default: false
    end
  end

  struct CMsgClientUCMDeletePublishedFile
    include Protobuf::Message

    contract_of "proto2" do
      optional :published_file_id, :fixed64, 1
      optional :app_id, :uint32, 2
    end
  end

  struct CMsgClientUCMDeletePublishedFileResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
    end
  end

  struct CMsgClientUCMEnumerateUserPublishedFiles
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :start_index, :uint32, 2
      optional :sort_order, :uint32, 3
    end
  end

  struct CMsgClientUCMEnumerateUserPublishedFilesResponse
    include Protobuf::Message

    struct PublishedFileId
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      repeated :published_files, CMsgClientUCMEnumerateUserPublishedFilesResponse::PublishedFileId, 2
      optional :total_results, :uint32, 3
    end
  end

  struct CMsgClientUCMEnumerateUserSubscribedFiles
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :start_index, :uint32, 2
      optional :list_type, :uint32, 3, default: 1_u32
      optional :matching_file_type, :uint32, 4, default: 0_u32
      optional :count, :uint32, 5, default: 50_u32
    end
  end

  struct CMsgClientUCMEnumerateUserSubscribedFilesResponse
    include Protobuf::Message

    struct PublishedFileId
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
        optional :rtime32_subscribed, :fixed32, 2, default: 0
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      repeated :subscribed_files, CMsgClientUCMEnumerateUserSubscribedFilesResponse::PublishedFileId, 2
      optional :total_results, :uint32, 3
    end
  end

  struct CMsgClientUCMEnumerateUserSubscribedFilesWithUpdates
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :start_index, :uint32, 2
      optional :start_time, :fixed32, 3
      optional :desired_revision, :uint32, 4, default: 0_u32
    end
  end

  struct CMsgClientUCMEnumerateUserSubscribedFilesWithUpdatesResponse
    include Protobuf::Message

    struct PublishedFileId
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
        optional :rtime32_subscribed, :fixed32, 2, default: 0
        optional :appid, :uint32, 3
        optional :file_hcontent, :fixed64, 4
        optional :file_size, :uint32, 5
        optional :rtime32_last_updated, :fixed32, 6
        optional :is_depot_content, :bool, 7
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      repeated :subscribed_files, CMsgClientUCMEnumerateUserSubscribedFilesWithUpdatesResponse::PublishedFileId, 2
      optional :total_results, :uint32, 3
    end
  end

  struct CMsgClientUCMPublishedFileUpdated
    include Protobuf::Message

    contract_of "proto2" do
      optional :published_file_id, :fixed64, 1
      optional :app_id, :uint32, 2
      optional :time_updated, :uint32, 3
      optional :hcontent, :fixed64, 4
      optional :file_size, :fixed32, 5
      optional :is_depot_content, :bool, 6
      optional :revision, :uint32, 7
    end
  end

  struct CMsgClientWorkshopItemChangesRequest
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :last_time_updated, :uint32, 2
      optional :num_items_needed, :uint32, 3
    end
  end

  struct CMsgClientWorkshopItemChangesResponse
    include Protobuf::Message

    struct WorkshopItemInfo
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
        optional :time_updated, :uint32, 2
        optional :manifest_id, :fixed64, 3
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :update_time, :uint32, 2
      repeated :workshop_items, CMsgClientWorkshopItemChangesResponse::WorkshopItemInfo, 5
    end
  end

  struct CMsgClientWorkshopItemInfoRequest
    include Protobuf::Message

    struct WorkshopItem
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
        optional :time_updated, :uint32, 2
      end
    end

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :last_time_updated, :uint32, 2
      repeated :workshop_items, CMsgClientWorkshopItemInfoRequest::WorkshopItem, 3
    end
  end

  struct CMsgClientWorkshopItemInfoResponse
    include Protobuf::Message

    struct WorkshopItemInfo
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
        optional :time_updated, :uint32, 2
        optional :manifest_id, :fixed64, 3
        optional :is_legacy, :bool, 4
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :update_time, :uint32, 2
      repeated :workshop_items, CMsgClientWorkshopItemInfoResponse::WorkshopItemInfo, 3
      repeated :private_items, :fixed64, 4
    end
  end

  struct CMsgClientUCMGetPublishedFilesForUser
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :creator_steam_id, :fixed64, 2
      repeated :required_tags, :string, 3
      repeated :excluded_tags, :string, 4
      optional :start_index, :uint32, 5
    end
  end

  struct CMsgClientUCMGetPublishedFilesForUserResponse
    include Protobuf::Message

    struct PublishedFileId
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      repeated :published_files, CMsgClientUCMGetPublishedFilesForUserResponse::PublishedFileId, 2
      optional :total_results, :uint32, 3
    end
  end

  struct CMsgClientUCMSetUserPublishedFileAction
    include Protobuf::Message

    contract_of "proto2" do
      optional :published_file_id, :fixed64, 1
      optional :app_id, :uint32, 2
      optional :action, :int32, 3
    end
  end

  struct CMsgClientUCMSetUserPublishedFileActionResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
    end
  end

  struct CMsgClientUCMEnumeratePublishedFilesByUserAction
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :start_index, :uint32, 2
      optional :action, :int32, 3
    end
  end

  struct CMsgClientUCMEnumeratePublishedFilesByUserActionResponse
    include Protobuf::Message

    struct PublishedFileId
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
        optional :rtime_time_stamp, :fixed32, 2, default: 0
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      repeated :published_files, CMsgClientUCMEnumeratePublishedFilesByUserActionResponse::PublishedFileId, 2
      optional :total_results, :uint32, 3
    end
  end

  struct CMsgClientScreenshotsChanged
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CMsgClientUpdateUserGameInfo
    include Protobuf::Message

    contract_of "proto2" do
      optional :steamid_idgs, :fixed64, 1
      optional :gameid, :fixed64, 2
      optional :game_ip, :uint32, 3
      optional :game_port, :uint32, 4
      optional :token, :bytes, 5
    end
  end

  struct CMsgClientRichPresenceUpload
    include Protobuf::Message

    contract_of "proto2" do
      optional :rich_presence_kv, :bytes, 1
      repeated :steamid_broadcast, :fixed64, 2
    end
  end

  struct CMsgClientRichPresenceRequest
    include Protobuf::Message

    contract_of "proto2" do
      repeated :steamid_request, :fixed64, 1
    end
  end

  struct CMsgClientRichPresenceInfo
    include Protobuf::Message

    struct RichPresence
      include Protobuf::Message

      contract_of "proto2" do
        optional :steamid_user, :fixed64, 1
        optional :rich_presence_kv, :bytes, 2
      end
    end

    contract_of "proto2" do
      repeated :rich_presence, CMsgClientRichPresenceInfo::RichPresence, 1
    end
  end

  struct CMsgClientCheckFileSignature
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
    end
  end

  struct CMsgClientCheckFileSignatureResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :pid, :uint32, 2
      optional :eresult, :uint32, 3
      optional :filename, :string, 4
      optional :esignatureresult, :uint32, 5
      optional :sha_file, :bytes, 6
      optional :signatureheader, :bytes, 7
      optional :filesize, :uint32, 8
      optional :getlasterror, :uint32, 9
      optional :evalvesignaturecheckdetail, :uint32, 10
    end
  end

  struct CMsgClientReadMachineAuth
    include Protobuf::Message

    contract_of "proto2" do
      optional :filename, :string, 1
      optional :offset, :uint32, 2
      optional :cubtoread, :uint32, 3
    end
  end

  struct CMsgClientReadMachineAuthResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :filename, :string, 1
      optional :eresult, :uint32, 2
      optional :filesize, :uint32, 3
      optional :sha_file, :bytes, 4
      optional :getlasterror, :uint32, 5
      optional :offset, :uint32, 6
      optional :cubread, :uint32, 7
      optional :bytes_read, :bytes, 8
      optional :filename_sentry, :string, 9
    end
  end

  struct CMsgClientUpdateMachineAuth
    include Protobuf::Message

    contract_of "proto2" do
      optional :filename, :string, 1
      optional :offset, :uint32, 2
      optional :cubtowrite, :uint32, 3
      optional :bytes, :bytes, 4
      optional :otp_type, :uint32, 5
      optional :otp_identifier, :string, 6
      optional :otp_sharedsecret, :bytes, 7
      optional :otp_timedrift, :uint32, 8
    end
  end

  struct CMsgClientUpdateMachineAuthResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :filename, :string, 1
      optional :eresult, :uint32, 2
      optional :filesize, :uint32, 3
      optional :sha_file, :bytes, 4
      optional :getlasterror, :uint32, 5
      optional :offset, :uint32, 6
      optional :cubwrote, :uint32, 7
      optional :otp_type, :int32, 8
      optional :otp_value, :uint32, 9
      optional :otp_identifier, :string, 10
    end
  end

  struct CMsgClientRequestMachineAuth
    include Protobuf::Message

    contract_of "proto2" do
      optional :filename, :string, 1
      optional :eresult_sentryfile, :uint32, 2
      optional :filesize, :uint32, 3
      optional :sha_sentryfile, :bytes, 4
      optional :lock_account_action, :int32, 6
      optional :otp_type, :uint32, 7
      optional :otp_identifier, :string, 8
      optional :otp_sharedsecret, :bytes, 9
      optional :otp_value, :uint32, 10
      optional :machine_name, :string, 11
      optional :machine_name_userchosen, :string, 12
    end
  end

  struct CMsgClientRequestMachineAuthResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :uint32, 1
    end
  end

  struct CMsgClientRegisterKey
    include Protobuf::Message

    contract_of "proto2" do
      optional :key, :string, 1
    end
  end

  struct CMsgClientPurchaseResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :purchase_result_details, :int32, 2
      optional :purchase_receipt_info, :bytes, 3
    end
  end

  struct CMsgClientActivateOEMLicense
    include Protobuf::Message

    contract_of "proto2" do
      optional :bios_manufacturer, :string, 1
      optional :bios_serialnumber, :string, 2
      optional :license_file, :bytes, 3
      optional :mainboard_manufacturer, :string, 4
      optional :mainboard_product, :string, 5
      optional :mainboard_serialnumber, :string, 6
    end
  end

  struct CMsgClientRegisterOEMMachine
    include Protobuf::Message

    contract_of "proto2" do
      optional :oem_register_file, :bytes, 1
    end
  end

  struct CMsgClientRegisterOEMMachineResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :uint32, 1
    end
  end

  struct CMsgClientPurchaseWithMachineID
    include Protobuf::Message

    contract_of "proto2" do
      optional :package_id, :uint32, 1
      optional :machine_info, :bytes, 2
    end
  end

  struct CMsgTrading_InitiateTradeRequest
    include Protobuf::Message

    contract_of "proto2" do
      optional :trade_request_id, :uint32, 1
      optional :other_steamid, :uint64, 2
      optional :other_name, :string, 3
    end
  end

  struct CMsgTrading_InitiateTradeResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :response, :uint32, 1
      optional :trade_request_id, :uint32, 2
      optional :other_steamid, :uint64, 3
      optional :steamguard_required_days, :uint32, 4
      optional :new_device_cooldown_days, :uint32, 5
      optional :default_password_reset_probation_days, :uint32, 6
      optional :password_reset_probation_days, :uint32, 7
      optional :default_email_change_probation_days, :uint32, 8
      optional :email_change_probation_days, :uint32, 9
    end
  end

  struct CMsgTrading_CancelTradeRequest
    include Protobuf::Message

    contract_of "proto2" do
      optional :other_steamid, :uint64, 1
    end
  end

  struct CMsgTrading_StartSession
    include Protobuf::Message

    contract_of "proto2" do
      optional :other_steamid, :uint64, 1
    end
  end

  struct CMsgClientGetCDNAuthToken
    include Protobuf::Message

    contract_of "proto2" do
      optional :depot_id, :uint32, 1
      optional :host_name, :string, 2
      optional :app_id, :uint32, 3
    end
  end

  struct CMsgClientGetDepotDecryptionKey
    include Protobuf::Message

    contract_of "proto2" do
      optional :depot_id, :uint32, 1
      optional :app_id, :uint32, 2
    end
  end

  struct CMsgClientGetDepotDecryptionKeyResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :depot_id, :uint32, 2
      optional :depot_encryption_key, :bytes, 3
    end
  end

  struct CMsgClientCheckAppBetaPassword
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :betapassword, :string, 2
    end
  end

  struct CMsgClientCheckAppBetaPasswordResponse
    include Protobuf::Message

    struct BetaPassword
      include Protobuf::Message

      contract_of "proto2" do
        optional :betaname, :string, 1
        optional :betapassword, :string, 2
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      repeated :betapasswords, CMsgClientCheckAppBetaPasswordResponse::BetaPassword, 4
    end
  end

  struct CMsgClientUpdateAppJobReport
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      repeated :depot_ids, :uint32, 2
      optional :app_state, :uint32, 3
      optional :job_app_error, :uint32, 4
      optional :error_details, :string, 5
      optional :job_duration, :uint32, 6
      optional :files_validation_failed, :uint32, 7
      optional :job_bytes_downloaded, :uint64, 8
      optional :job_bytes_staged, :uint64, 9
      optional :bytes_comitted, :uint64, 10
      optional :start_app_state, :uint32, 11
      optional :stats_machine_id, :fixed64, 12
      optional :branch_name, :string, 13
      optional :total_bytes_downloaded, :uint64, 14
      optional :total_bytes_staged, :uint64, 15
      optional :total_bytes_restored, :uint64, 16
      optional :is_borrowed, :bool, 17
      optional :is_free_weekend, :bool, 18
      optional :total_bytes_legacy, :uint64, 19
      optional :total_bytes_patched, :uint64, 20
      optional :total_bytes_saved, :uint64, 21
      optional :cell_id, :uint32, 22
    end
  end

  struct CMsgClientDPContentStatsReport
    include Protobuf::Message

    contract_of "proto2" do
      optional :stats_machine_id, :fixed64, 1
      optional :country_code, :string, 2
      optional :os_type, :int32, 3
      optional :language, :int32, 4
      optional :num_install_folders, :uint32, 5
      optional :num_installed_games, :uint32, 6
      optional :size_installed_games, :uint64, 7
    end
  end

  struct CMsgClientGetCDNAuthTokenResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :uint32, 1, default: 2_u32
      optional :token, :string, 2
      optional :expiration_time, :uint32, 3
    end
  end

  struct CMsgDownloadRateStatistics
    include Protobuf::Message

    struct StatsInfo
      include Protobuf::Message

      contract_of "proto2" do
        optional :source_type, :uint32, 1
        optional :source_id, :uint32, 2
        optional :seconds, :uint32, 3
        optional :bytes, :uint64, 4
        optional :host_name, :string, 5
        optional :microseconds, :uint64, 6
        optional :used_ipv6, :bool, 7
        optional :proxied, :bool, 8
      end
    end

    contract_of "proto2" do
      optional :cell_id, :uint32, 1
      repeated :stats, CMsgDownloadRateStatistics::StatsInfo, 2
      optional :throttling_kbps, :uint32, 3
    end
  end

  struct CMsgClientRequestAccountData
    include Protobuf::Message

    contract_of "proto2" do
      optional :account_or_email, :string, 1
      optional :action, :uint32, 2
    end
  end

  struct CMsgClientRequestAccountDataResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :action, :uint32, 1
      optional :eresult, :uint32, 2
      optional :account_name, :string, 3
      optional :ct_matches, :uint32, 4
      optional :account_name_suggestion1, :string, 5
      optional :account_name_suggestion2, :string, 6
      optional :account_name_suggestion3, :string, 7
    end
  end

  struct CMsgClientUGSGetGlobalStats
    include Protobuf::Message

    contract_of "proto2" do
      optional :gameid, :uint64, 1
      optional :history_days_requested, :uint32, 2
      optional :time_last_requested, :fixed32, 3
      optional :first_day_cached, :uint32, 4
      optional :days_cached, :uint32, 5
    end
  end

  struct CMsgClientUGSGetGlobalStatsResponse
    include Protobuf::Message

    struct Day
      include Protobuf::Message

      struct Stat
        include Protobuf::Message

        contract_of "proto2" do
          optional :stat_id, :int32, 1
          optional :data, :int64, 2
        end
      end

      contract_of "proto2" do
        optional :day_id, :uint32, 1
        repeated :stats, CMsgClientUGSGetGlobalStatsResponse::Day::Stat, 2
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :timestamp, :fixed32, 2
      optional :day_current, :int32, 3
      repeated :days, CMsgClientUGSGetGlobalStatsResponse::Day, 4
    end
  end

  struct CMsgGameServerData
    include Protobuf::Message

    struct Player
      include Protobuf::Message

      contract_of "proto2" do
        optional :steam_id, :fixed64, 1
      end
    end

    contract_of "proto2" do
      optional :steam_id_gs, :fixed64, 1
      optional :deprecated_ip, :uint32, 2
      optional :query_port, :uint32, 3
      optional :game_port, :uint32, 4
      optional :sourcetv_port, :uint32, 5
      optional :name, :string, 22
      optional :game_ip_address, CMsgIPAddress, 23
      optional :app_id, :uint32, 6
      optional :gamedir, :string, 7
      optional :version, :string, 8
      optional :product, :string, 9
      optional :region, :string, 10
      repeated :players, CMsgGameServerData::Player, 11
      optional :max_players, :uint32, 12
      optional :bot_count, :uint32, 13
      optional :password, :bool, 14
      optional :secure, :bool, 15
      optional :dedicated, :bool, 16
      optional :os, :string, 17
      optional :game_data, :string, 18
      optional :game_data_version, :uint32, 19
      optional :game_type, :string, 20
      optional :map, :string, 21
    end
  end

  struct CMsgGameServerRemove
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
      optional :deprecated_ip, :uint32, 2
      optional :query_port, :uint32, 3
      optional :ip, CMsgIPAddress, 4
    end
  end

  struct CMsgClientGMSServerQuery
    include Protobuf::Message

    contract_of "proto2" do
      optional :app_id, :uint32, 1
      optional :geo_location_ip, :uint32, 2
      optional :region_code, :uint32, 3
      optional :filter_text, :string, 4
      optional :max_servers, :uint32, 5
    end
  end

  struct CMsgGMSClientServerQueryResponse
    include Protobuf::Message

    struct Server
      include Protobuf::Message

      contract_of "proto2" do
        optional :deprecated_server_ip, :uint32, 1
        optional :server_port, :uint32, 2
        optional :auth_players, :uint32, 3
        optional :server_ip, CMsgIPAddress, 4
      end
    end

    contract_of "proto2" do
      repeated :servers, CMsgGMSClientServerQueryResponse::Server, 1
      optional :error, :string, 2
    end
  end

  struct CMsgGameServerOutOfDate
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id_gs, :fixed64, 1
      optional :reject, :bool, 2
      optional :message, :string, 3
    end
  end

  struct CMsgClientRedeemGuestPass
    include Protobuf::Message

    contract_of "proto2" do
      optional :guest_pass_id, :fixed64, 1
    end
  end

  struct CMsgClientRedeemGuestPassResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :uint32, 1, default: 2_u32
      optional :package_id, :uint32, 2
      optional :must_own_appid, :uint32, 3
    end
  end

  struct CMsgClientGetClanActivityCounts
    include Protobuf::Message

    contract_of "proto2" do
      repeated :steamid_clans, :uint64, 1
    end
  end

  struct CMsgClientGetClanActivityCountsResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :uint32, 1, default: 2_u32
    end
  end

  struct CMsgClientOGSReportString
    include Protobuf::Message

    contract_of "proto2" do
      optional :accumulated, :bool, 1
      optional :sessionid, :uint64, 2
      optional :severity, :int32, 3
      optional :formatter, :string, 4
      optional :varargs, :bytes, 5
    end
  end

  struct CMsgClientOGSReportBug
    include Protobuf::Message

    contract_of "proto2" do
      optional :sessionid, :uint64, 1
      optional :bugtext, :string, 2
      optional :screenshot, :bytes, 3
    end
  end

  struct CMsgGSAssociateWithClan
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id_clan, :fixed64, 1
    end
  end

  struct CMsgGSAssociateWithClanResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id_clan, :fixed64, 1
      optional :eresult, :uint32, 2, default: 2_u32
    end
  end

  struct CMsgGSComputeNewPlayerCompatibility
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id_candidate, :fixed64, 1
    end
  end

  struct CMsgGSComputeNewPlayerCompatibilityResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id_candidate, :fixed64, 1
      optional :eresult, :uint32, 2, default: 2_u32
      optional :is_clan_member, :bool, 3
      optional :ct_dont_like_you, :int32, 4
      optional :ct_you_dont_like, :int32, 5
      optional :ct_clanmembers_dont_like_you, :int32, 6
    end
  end

  struct CMsgClientSentLogs
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CMsgGCClient
    include Protobuf::Message

    contract_of "proto2" do
      optional :appid, :uint32, 1
      optional :msgtype, :uint32, 2
      optional :payload, :bytes, 3
      optional :steamid, :fixed64, 4
      optional :gcname, :string, 5
      optional :ip, :uint32, 6
    end
  end

  struct CMsgClientRequestFreeLicense
    include Protobuf::Message

    contract_of "proto2" do
      repeated :appids, :uint32, 2
    end
  end

  struct CMsgClientRequestFreeLicenseResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :uint32, 1, default: 2_u32
      repeated :granted_packageids, :uint32, 2
      repeated :granted_appids, :uint32, 3
    end
  end

  struct CMsgDRMDownloadRequestWithCrashData
    include Protobuf::Message

    contract_of "proto2" do
      optional :download_flags, :uint32, 1
      optional :download_types_known, :uint32, 2
      optional :guid_drm, :bytes, 3
      optional :guid_split, :bytes, 4
      optional :guid_merge, :bytes, 5
      optional :module_name, :string, 6
      optional :module_path, :string, 7
      optional :crash_data, :bytes, 8
    end
  end

  struct CMsgDRMDownloadResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :uint32, 1, default: 2_u32
      optional :app_id, :uint32, 2
      optional :blob_download_type, :uint32, 3
      optional :merge_guid, :bytes, 4
      optional :download_file_dfs_ip, :uint32, 5
      optional :download_file_dfs_port, :uint32, 6
      optional :download_file_url, :string, 7
      optional :module_path, :string, 8
    end
  end

  struct CMsgDRMFinalResult
    include Protobuf::Message

    contract_of "proto2" do
      optional :e_result, :uint32, 1, default: 2_u32
      optional :app_id, :uint32, 2
      optional :blob_download_type, :uint32, 3
      optional :error_detail, :uint32, 4
      optional :merge_guid, :bytes, 5
      optional :download_file_dfs_ip, :uint32, 6
      optional :download_file_dfs_port, :uint32, 7
      optional :download_file_url, :string, 8
    end
  end

  struct CMsgClientDPCheckSpecialSurvey
    include Protobuf::Message

    contract_of "proto2" do
      optional :survey_id, :uint32, 1
    end
  end

  struct CMsgClientDPCheckSpecialSurveyResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :e_result, :uint32, 1, default: 2_u32
      optional :state, :uint32, 2
      optional :name, :string, 3
      optional :custom_url, :string, 4
      optional :include_software, :bool, 5
      optional :token, :bytes, 6
    end
  end

  struct CMsgClientDPSendSpecialSurveyResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :survey_id, :uint32, 1
      optional :data, :bytes, 2
    end
  end

  struct CMsgClientDPSendSpecialSurveyResponseReply
    include Protobuf::Message

    contract_of "proto2" do
      optional :e_result, :uint32, 1, default: 2_u32
      optional :token, :bytes, 2
    end
  end

  struct CMsgClientRequestForgottenPasswordEmail
    include Protobuf::Message

    contract_of "proto2" do
      optional :account_name, :string, 1
      optional :password_tried, :string, 2
    end
  end

  struct CMsgClientRequestForgottenPasswordEmailResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :e_result, :uint32, 1
      optional :use_secret_question, :bool, 2
    end
  end

  struct CMsgClientItemAnnouncements
    include Protobuf::Message

    struct UnseenItem
      include Protobuf::Message

      contract_of "proto2" do
        optional :appid, :uint32, 1
        optional :context_id, :uint64, 2
        optional :asset_id, :uint64, 3
        optional :amount, :uint64, 4
        optional :rtime32_gained, :fixed32, 5
        optional :source_appid, :uint32, 6
      end
    end

    contract_of "proto2" do
      optional :count_new_items, :uint32, 1
      repeated :unseen_items, CMsgClientItemAnnouncements::UnseenItem, 2
    end
  end

  struct CMsgClientRequestItemAnnouncements
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CMsgClientUserNotifications
    include Protobuf::Message

    struct Notification
      include Protobuf::Message

      contract_of "proto2" do
        optional :user_notification_type, :uint32, 1
        optional :count, :uint32, 2
      end
    end

    contract_of "proto2" do
      repeated :notifications, CMsgClientUserNotifications::Notification, 1
    end
  end

  struct CMsgClientCommentNotifications
    include Protobuf::Message

    contract_of "proto2" do
      optional :count_new_comments, :uint32, 1
      optional :count_new_comments_owner, :uint32, 2
      optional :count_new_comments_subscriptions, :uint32, 3
    end
  end

  struct CMsgClientRequestCommentNotifications
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CMsgClientOfflineMessageNotification
    include Protobuf::Message

    contract_of "proto2" do
      optional :offline_messages, :uint32, 1
      repeated :friends_with_offline_messages, :uint32, 2
    end
  end

  struct CMsgClientRequestOfflineMessageCount
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CMsgClientChatGetFriendMessageHistory
    include Protobuf::Message

    contract_of "proto2" do
      optional :steamid, :fixed64, 1
    end
  end

  struct CMsgClientChatGetFriendMessageHistoryResponse
    include Protobuf::Message

    struct FriendMessage
      include Protobuf::Message

      contract_of "proto2" do
        optional :accountid, :uint32, 1
        optional :timestamp, :uint32, 2
        optional :message, :string, 3
        optional :unread, :bool, 4
      end
    end

    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :success, :uint32, 2
      repeated :messages, CMsgClientChatGetFriendMessageHistoryResponse::FriendMessage, 3
    end
  end

  struct CMsgClientChatGetFriendMessageHistoryForOfflineMessages
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CMsgClientFSGetFriendsSteamLevels
    include Protobuf::Message

    contract_of "proto2" do
      repeated :accountids, :uint32, 1
    end
  end

  struct CMsgClientFSGetFriendsSteamLevelsResponse
    include Protobuf::Message

    struct Friend
      include Protobuf::Message

      contract_of "proto2" do
        optional :accountid, :uint32, 1
        optional :level, :uint32, 2
      end
    end

    contract_of "proto2" do
      repeated :friends, CMsgClientFSGetFriendsSteamLevelsResponse::Friend, 1
    end
  end

  struct CMsgClientEmailAddrInfo
    include Protobuf::Message

    contract_of "proto2" do
      optional :email_address, :string, 1
      optional :email_is_validated, :bool, 2
      optional :email_validation_changed, :bool, 3
      optional :credential_change_requires_code, :bool, 4
      optional :password_or_secretqa_change_requires_code, :bool, 5
      optional :remind_user_about_email, :bool, 6
    end
  end

  struct CMsgCREItemVoteSummary
    include Protobuf::Message

    struct PublishedFileId
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
      end
    end

    contract_of "proto2" do
      repeated :published_file_ids, CMsgCREItemVoteSummary::PublishedFileId, 1
    end
  end

  struct CMsgCREItemVoteSummaryResponse
    include Protobuf::Message

    struct ItemVoteSummary
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
        optional :votes_for, :int32, 2
        optional :votes_against, :int32, 3
        optional :reports, :int32, 4
        optional :score, :float, 5
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      repeated :item_vote_summaries, CMsgCREItemVoteSummaryResponse::ItemVoteSummary, 2
    end
  end

  struct CMsgCREUpdateUserPublishedItemVote
    include Protobuf::Message

    contract_of "proto2" do
      optional :published_file_id, :fixed64, 1
      optional :vote_up, :bool, 2
    end
  end

  struct CMsgCREUpdateUserPublishedItemVoteResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
    end
  end

  struct CMsgCREGetUserPublishedItemVoteDetails
    include Protobuf::Message

    struct PublishedFileId
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
      end
    end

    contract_of "proto2" do
      repeated :published_file_ids, CMsgCREGetUserPublishedItemVoteDetails::PublishedFileId, 1
    end
  end

  struct CMsgCREGetUserPublishedItemVoteDetailsResponse
    include Protobuf::Message

    struct UserItemVoteDetail
      include Protobuf::Message

      contract_of "proto2" do
        optional :published_file_id, :fixed64, 1
        optional :vote, :int32, 2, default: 0
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      repeated :user_item_vote_details, CMsgCREGetUserPublishedItemVoteDetailsResponse::UserItemVoteDetail, 2
    end
  end

  struct CMsgGameServerPingSample
    include Protobuf::Message

    struct Sample
      include Protobuf::Message

      contract_of "proto2" do
        optional :ip, :fixed32, 1
        optional :avg_ping_ms, :uint32, 2
        optional :stddev_ping_ms_x10, :uint32, 3
      end
    end

    contract_of "proto2" do
      optional :my_ip, :fixed32, 1
      optional :gs_app_id, :int32, 2
      repeated :gs_samples, CMsgGameServerPingSample::Sample, 3
    end
  end

  struct CMsgFSGetFollowerCount
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
    end
  end

  struct CMsgFSGetFollowerCountResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :count, :int32, 2, default: 0
    end
  end

  struct CMsgFSGetIsFollowing
    include Protobuf::Message

    contract_of "proto2" do
      optional :steam_id, :fixed64, 1
    end
  end

  struct CMsgFSGetIsFollowingResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :is_following, :bool, 2, default: false
    end
  end

  struct CMsgFSEnumerateFollowingList
    include Protobuf::Message

    contract_of "proto2" do
      optional :start_index, :uint32, 1
    end
  end

  struct CMsgFSEnumerateFollowingListResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :total_results, :int32, 2
      repeated :steam_ids, :fixed64, 3
    end
  end

  struct CMsgDPGetNumberOfCurrentPlayers
    include Protobuf::Message

    contract_of "proto2" do
      optional :appid, :uint32, 1
    end
  end

  struct CMsgDPGetNumberOfCurrentPlayersResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :player_count, :int32, 2
    end
  end

  struct CMsgClientFriendUserStatusPublished
    include Protobuf::Message

    contract_of "proto2" do
      optional :friend_steamid, :fixed64, 1
      optional :appid, :uint32, 2
      optional :status_text, :string, 3
    end
  end

  struct CMsgClientServiceMethodLegacy
    include Protobuf::Message

    contract_of "proto2" do
      optional :method_name, :string, 1
      optional :serialized_method, :bytes, 2
      optional :is_notification, :bool, 3
    end
  end

  struct CMsgClientServiceMethodLegacyResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :method_name, :string, 1
      optional :serialized_method_response, :bytes, 2
    end
  end

  struct CMsgClientUIMode
    include Protobuf::Message

    contract_of "proto2" do
      optional :uimode, :uint32, 1
      optional :chat_mode, :uint32, 2
    end
  end

  struct CMsgClientVanityURLChangedNotification
    include Protobuf::Message

    contract_of "proto2" do
      optional :vanity_url, :string, 1
    end
  end

  struct CMsgClientAuthorizeLocalDeviceRequest
    include Protobuf::Message

    contract_of "proto2" do
      optional :device_description, :string, 1
      optional :owner_account_id, :uint32, 2
      optional :local_device_token, :uint64, 3
    end
  end

  struct CMsgClientAuthorizeLocalDevice
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :owner_account_id, :uint32, 2
      optional :authed_device_token, :uint64, 3
    end
  end

  struct CMsgClientAuthorizeLocalDeviceNotification
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :owner_account_id, :uint32, 2
      optional :local_device_token, :uint64, 3
    end
  end

  struct CMsgClientDeauthorizeDeviceRequest
    include Protobuf::Message

    contract_of "proto2" do
      optional :deauthorization_account_id, :uint32, 1
      optional :deauthorization_device_token, :uint64, 2
    end
  end

  struct CMsgClientDeauthorizeDevice
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :deauthorization_account_id, :uint32, 2
    end
  end

  struct CMsgClientUseLocalDeviceAuthorizations
    include Protobuf::Message

    struct DeviceToken
      include Protobuf::Message

      contract_of "proto2" do
        optional :owner_account_id, :uint32, 1
        optional :token_id, :uint64, 2
      end
    end

    contract_of "proto2" do
      repeated :authorization_account_id, :uint32, 1
      repeated :device_tokens, CMsgClientUseLocalDeviceAuthorizations::DeviceToken, 2
    end
  end

  struct CMsgClientGetAuthorizedDevices
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CMsgClientGetAuthorizedDevicesResponse
    include Protobuf::Message

    struct AuthorizedDevice
      include Protobuf::Message

      contract_of "proto2" do
        optional :auth_device_token, :uint64, 1
        optional :device_name, :string, 2
        optional :last_access_time, :uint32, 3
        optional :borrower_id, :uint32, 4
        optional :is_pending, :bool, 5
        optional :app_played, :uint32, 6
      end
    end

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      repeated :authorized_device, CMsgClientGetAuthorizedDevicesResponse::AuthorizedDevice, 2
    end
  end

  struct CMsgClientSharedLibraryLockStatus
    include Protobuf::Message

    struct LockedLibrary
      include Protobuf::Message

      contract_of "proto2" do
        optional :owner_id, :uint32, 1
        optional :locked_by, :uint32, 2
      end
    end

    contract_of "proto2" do
      repeated :locked_library, CMsgClientSharedLibraryLockStatus::LockedLibrary, 1
      optional :own_library_locked_by, :uint32, 2
    end
  end

  struct CMsgClientSharedLibraryStopPlaying
    include Protobuf::Message

    struct StopApp
      include Protobuf::Message

      contract_of "proto2" do
        optional :app_id, :uint32, 1
        optional :owner_id, :uint32, 2
      end
    end

    contract_of "proto2" do
      optional :seconds_left, :int32, 1
      repeated :stop_apps, CMsgClientSharedLibraryStopPlaying::StopApp, 2
    end
  end

  struct CMsgClientServiceCall
    include Protobuf::Message

    contract_of "proto2" do
      optional :sysid_routing, :bytes, 1
      optional :call_handle, :uint32, 2
      optional :module_crc, :uint32, 3
      optional :module_hash, :bytes, 4
      optional :function_id, :uint32, 5
      optional :cub_output_max, :uint32, 6
      optional :flags, :uint32, 7
      optional :callparameter, :bytes, 8
      optional :ping_only, :bool, 9
      optional :max_outstanding_calls, :uint32, 10
    end
  end

  struct CMsgClientServiceModule
    include Protobuf::Message

    contract_of "proto2" do
      optional :module_crc, :uint32, 1
      optional :module_hash, :bytes, 2
      optional :module_content, :bytes, 3
    end
  end

  struct CMsgClientServiceCallResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :sysid_routing, :bytes, 1
      optional :call_handle, :uint32, 2
      optional :module_crc, :uint32, 3
      optional :module_hash, :bytes, 4
      optional :ecallresult, :uint32, 5
      optional :result_content, :bytes, 6
      optional :os_version_info, :bytes, 7
      optional :system_info, :bytes, 8
      optional :load_address, :fixed64, 9
      optional :exception_record, :bytes, 10
      optional :portable_os_version_info, :bytes, 11
      optional :portable_system_info, :bytes, 12
      optional :was_converted, :bool, 13
      optional :internal_result, :uint32, 14
      optional :current_count, :uint32, 15
      optional :last_call_handle, :uint32, 16
      optional :last_call_module_crc, :uint32, 17
      optional :last_call_sysid_routing, :bytes, 18
      optional :last_ecallresult, :uint32, 19
      optional :last_callissue_delta, :uint32, 20
      optional :last_callcomplete_delta, :uint32, 21
    end
  end

  struct CMsgAMUnlockStreaming
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CMsgAMUnlockStreamingResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :encryption_key, :bytes, 2
    end
  end

  struct CMsgAMUnlockHEVC
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CMsgAMUnlockHEVCResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
    end
  end

  struct CMsgClientPlayingSessionState
    include Protobuf::Message

    contract_of "proto2" do
      optional :playing_blocked, :bool, 2
      optional :playing_app, :uint32, 3
    end
  end

  struct CMsgClientKickPlayingSession
    include Protobuf::Message

    contract_of "proto2" do
      optional :only_stop_game, :bool, 1
    end
  end

  struct CMsgClientVoiceCallPreAuthorize
    include Protobuf::Message

    contract_of "proto2" do
      optional :caller_steamid, :fixed64, 1
      optional :receiver_steamid, :fixed64, 2
      optional :caller_id, :int32, 3
      optional :hangup, :bool, 4
    end
  end

  struct CMsgClientVoiceCallPreAuthorizeResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :caller_steamid, :fixed64, 1
      optional :receiver_steamid, :fixed64, 2
      optional :eresult, :int32, 3, default: 2
      optional :caller_id, :int32, 4
    end
  end

  struct CMsgBadgeCraftedNotification
    include Protobuf::Message

    contract_of "proto2" do
      optional :appid, :uint32, 1
      optional :badge_level, :uint32, 2
    end
  end
end
