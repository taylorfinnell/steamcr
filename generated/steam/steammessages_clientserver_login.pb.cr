# # Generated from steammessages_clientserver_login.proto
require "protobuf"

module Steam
  struct CMsgClientHeartBeat
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CMsgClientServerTimestampRequest
    include Protobuf::Message

    contract_of "proto2" do
      optional :client_request_timestamp, :uint64, 1
    end
  end

  struct CMsgClientServerTimestampResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :client_request_timestamp, :uint64, 1
      optional :server_timestamp_ms, :uint64, 2
    end
  end

  struct CMsgClientSecret
    include Protobuf::Message

    contract_of "proto2" do
      optional :version, :uint32, 1
      optional :appid, :uint32, 2
      optional :deviceid, :uint32, 3
      optional :nonce, :fixed64, 4
      optional :hmac, :bytes, 5
    end
  end

  struct CMsgClientLogon
    include Protobuf::Message

    contract_of "proto2" do
      optional :protocol_version, :uint32, 1
      optional :deprecated_obfustucated_private_ip, :uint32, 2
      optional :cell_id, :uint32, 3
      optional :last_session_id, :uint32, 4
      optional :client_package_version, :uint32, 5
      optional :client_language, :string, 6
      optional :client_os_type, :uint32, 7
      optional :should_remember_password, :bool, 8, default: false
      optional :wine_version, :string, 9
      optional :deprecated_10, :uint32, 10
      optional :obfuscated_private_ip, CMsgIPAddress, 11
      optional :deprecated_public_ip, :uint32, 20
      optional :qos_level, :uint32, 21
      optional :client_supplied_steam_id, :fixed64, 22
      optional :public_ip, CMsgIPAddress, 23
      optional :machine_id, :bytes, 30
      optional :launcher_type, :uint32, 31, default: 0_u32
      optional :ui_mode, :uint32, 32, default: 0_u32
      optional :chat_mode, :uint32, 33, default: 0_u32
      optional :steam2_auth_ticket, :bytes, 41
      optional :email_address, :string, 42
      optional :rtime32_account_creation, :fixed32, 43
      optional :account_name, :string, 50
      optional :password, :string, 51
      optional :game_server_token, :string, 52
      optional :login_key, :string, 60
      optional :was_converted_deprecated_msg, :bool, 70, default: false
      optional :anon_user_target_account_name, :string, 80
      optional :resolved_user_steam_id, :fixed64, 81
      optional :eresult_sentryfile, :int32, 82
      optional :sha_sentryfile, :bytes, 83
      optional :auth_code, :string, 84
      optional :otp_type, :int32, 85
      optional :otp_value, :uint32, 86
      optional :otp_identifier, :string, 87
      optional :steam2_ticket_request, :bool, 88
      optional :sony_psn_ticket, :bytes, 90
      optional :sony_psn_service_id, :string, 91
      optional :create_new_psn_linked_account_if_needed, :bool, 92, default: false
      optional :sony_psn_name, :string, 93
      optional :game_server_app_id, :int32, 94
      optional :steamguard_dont_remember_computer, :bool, 95
      optional :machine_name, :string, 96
      optional :machine_name_userchosen, :string, 97
      optional :country_override, :string, 98
      optional :is_steam_box, :bool, 99
      optional :client_instance_id, :uint64, 100
      optional :two_factor_code, :string, 101
      optional :supports_rate_limit_response, :bool, 102
      optional :web_logon_nonce, :string, 103
      optional :priority_reason, :int32, 104
      optional :embedded_client_secret, CMsgClientSecret, 105
      optional :disable_partner_autogrants, :bool, 106
    end
  end

  struct CMsgClientLogonResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :out_of_game_heartbeat_seconds, :int32, 2
      optional :in_game_heartbeat_seconds, :int32, 3
      optional :deprecated_public_ip, :uint32, 4
      optional :rtime32_server_time, :fixed32, 5
      optional :account_flags, :uint32, 6
      optional :cell_id, :uint32, 7
      optional :email_domain, :string, 8
      optional :steam2_ticket, :bytes, 9
      optional :eresult_extended, :int32, 10
      optional :webapi_authenticate_user_nonce, :string, 11
      optional :cell_id_ping_threshold, :uint32, 12
      optional :deprecated_use_pics, :bool, 13
      optional :vanity_url, :string, 14
      optional :public_ip, CMsgIPAddress, 15
      optional :client_supplied_steamid, :fixed64, 20
      optional :ip_country_code, :string, 21
      optional :parental_settings, :bytes, 22
      optional :parental_setting_signature, :bytes, 23
      optional :count_loginfailures_to_migrate, :int32, 24
      optional :count_disconnects_to_migrate, :int32, 25
      optional :ogs_data_report_time_window, :int32, 26
      optional :client_instance_id, :uint64, 27
      optional :force_client_update_check, :bool, 28
    end
  end

  struct CMsgClientRequestWebAPIAuthenticateUserNonce
    include Protobuf::Message

    contract_of "proto2" do
      optional :token_type, :int32, 1, default: -1
    end
  end

  struct CMsgClientRequestWebAPIAuthenticateUserNonceResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
      optional :webapi_authenticate_user_nonce, :string, 11
      optional :token_type, :int32, 3, default: -1
    end
  end

  struct CMsgClientLogOff
    include Protobuf::Message

    contract_of "proto2" do
    end
  end

  struct CMsgClientLoggedOff
    include Protobuf::Message

    contract_of "proto2" do
      optional :eresult, :int32, 1, default: 2
    end
  end

  struct CMsgClientNewLoginKey
    include Protobuf::Message

    contract_of "proto2" do
      optional :unique_id, :uint32, 1
      optional :login_key, :string, 2
    end
  end

  struct CMsgClientNewLoginKeyAccepted
    include Protobuf::Message

    contract_of "proto2" do
      optional :unique_id, :uint32, 1
    end
  end

  struct CMsgClientAccountInfo
    include Protobuf::Message

    contract_of "proto2" do
      optional :persona_name, :string, 1
      optional :ip_country, :string, 2
      optional :count_authed_computers, :int32, 5
      optional :account_flags, :uint32, 7
      optional :facebook_id, :uint64, 8
      optional :facebook_name, :string, 9
      optional :steamguard_notify_newmachines, :bool, 14
      optional :steamguard_machine_name_user_chosen, :string, 15
      optional :is_phone_verified, :bool, 16
      optional :two_factor_state, :uint32, 17
      optional :is_phone_identifying, :bool, 18
      optional :is_phone_needing_reverify, :bool, 19
    end
  end

  struct CMsgClientChallengeRequest
    include Protobuf::Message

    contract_of "proto2" do
      optional :steamid, :fixed64, 1
    end
  end

  struct CMsgClientChallengeResponse
    include Protobuf::Message

    contract_of "proto2" do
      optional :challenge, :fixed64, 1
    end
  end
end
