module Steamcr
  enum EResult
    def self.from_io(io, format)
      EResult.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID                           =  0
    OK                                =  1
    FAIL                              =  2
    NO_CONNECTION                     =  3
    INVALID_PASSWORD                  =  5
    LOGGED_IN_ELSEWHERE               =  6
    INVALID_PROTOCOL_VER              =  7
    INVALID_PARAM                     =  8
    FILE_NOT_FOUND                    =  9
    BUSY                              = 10
    INVALID_STATE                     = 11
    INVALID_NAME                      = 12
    INVALID_EMAIL                     = 13
    DUPLICATE_NAME                    = 14
    ACCESS_DENIED                     = 15
    TIMEOUT                           = 16
    BANNED                            = 17
    ACCOUNT_NOT_FOUND                 = 18
    INVALID_STEAM_ID                  = 19
    SERVICE_UNAVAILABLE               = 20
    NOT_LOGGED_ON                     = 21
    PENDING                           = 22
    ENCRYPTION_FAILURE                = 23
    INSUFFICIENT_PRIVILEGE            = 24
    LIMIT_EXCEEDED                    = 25
    REVOKED                           = 26
    EXPIRED                           = 27
    ALREADY_REDEEMED                  = 28
    DUPLICATE_REQUEST                 = 29
    ALREADY_OWNED                     = 30
    IP_NOT_FOUND                      = 31
    PERSIST_FAILED                    = 32
    LOCKING_FAILED                    = 33
    LOGON_SESSION_REPLACED            = 34
    CONNECT_FAILED                    = 35
    HANDSHAKE_FAILED                  = 36
    IO_FAILURE                        = 37
    REMOTE_DISCONNECT                 = 38
    SHOPPING_CART_NOT_FOUND           = 39
    BLOCKED                           = 40
    IGNORED                           = 41
    NO_MATCH                          = 42
    ACCOUNT_DISABLED                  = 43
    SERVICE_READ_ONLY                 = 44
    ACCOUNT_NOT_FEATURED              = 45
    ADMINISTRATOR_OK                  = 46
    CONTENT_VERSION                   = 47
    TRY_ANOTHER_CM                    = 48
    PASSWORD_REQUIRED_TO_KICK_SESSION = 49
    ALREADY_LOGGED_IN_ELSEWHERE       = 50
    SUSPENDED                         = 51
    CANCELLED                         = 52
    DATA_CORRUPTION                   = 53
    DISK_FULL                         = 54
    REMOTE_CALL_FAILED                = 55
    #  PASSWORD_NOT_SET = 56 # deprecated (renamed to PasswordUnset)
    PASSWORD_UNSET                  = 56
    EXTERNAL_ACCOUNT_UNLINKED       = 57
    PSN_TICKET_INVALID              = 58
    EXTERNAL_ACCOUNT_ALREADY_LINKED = 59
    REMOTE_FILE_CONFLICT            = 60
    ILLEGAL_PASSWORD                = 61
    SAME_AS_PREVIOUS_VALUE          = 62
    ACCOUNT_LOGON_DENIED            = 63
    CANNOT_USE_OLD_PASSWORD         = 64
    INVALID_LOGIN_AUTH_CODE         = 65
    #  ACCOUNT_LOGON_DENIED_NO_MAIL_SENT = 66 # deprecated (renamed to AccountLogonDeniedNoMail)
    ACCOUNT_LOGON_DENIED_NO_MAIL = 66
    HARDWARE_NOT_CAPABLE_OF_IPT  = 67
    IPT_INIT_ERROR               = 68
    PARENTAL_CONTROL_RESTRICTED  = 69
    FACEBOOK_QUERY_ERROR         = 70
    EXPIRED_LOGIN_AUTH_CODE      = 71
    IP_LOGIN_RESTRICTION_FAILED  = 72
    #  ACCOUNT_LOCKED = 73 # deprecated (renamed to AccountLockedDown)
    ACCOUNT_LOCKED_DOWN                          = 73
    ACCOUNT_LOGON_DENIED_VERIFIED_EMAIL_REQUIRED = 74
    NO_MATCHING_URL                              = 75
    BAD_RESPONSE                                 = 76
    REQUIRE_PASSWORD_RE_ENTRY                    = 77
    VALUE_OUT_OF_RANGE                           = 78
    UNEXPECTED_ERROR                             = 79
    DISABLED                                     = 80
    INVALID_CEG_SUBMISSION                       = 81
    RESTRICTED_DEVICE                            = 82
    REGION_LOCKED                                = 83
    RATE_LIMIT_EXCEEDED                          = 84
    #  ACCOUNT_LOGON_DENIED_NEED_TWO_FACTOR_CODE = 85 # deprecated (renamed to AccountLoginDeniedNeedTwoFactor)
    ACCOUNT_LOGIN_DENIED_NEED_TWO_FACTOR = 85
    #  ITEM_OR_ENTRY_HAS_BEEN_DELETED = 86 # deprecated (renamed to ItemDeleted)
    ITEM_DELETED                        = 86
    ACCOUNT_LOGIN_DENIED_THROTTLE       = 87
    TWO_FACTOR_CODE_MISMATCH            = 88
    TWO_FACTOR_ACTIVATION_CODE_MISMATCH = 89
    #  ACCOUNT_ASSOCIATED_TO_MULTIPLE_PLAYERS = 90 # deprecated (renamed to AccountAssociatedToMultiplePartners)
    ACCOUNT_ASSOCIATED_TO_MULTIPLE_PARTNERS = 90
    NOT_MODIFIED                            = 91
    #  NO_MOBILE_DEVICE_AVAILABLE = 92 # deprecated (renamed to NoMobileDevice)
    NO_MOBILE_DEVICE = 92
    #  TIME_IS_OUT_OF_SYNC = 93 # deprecated (renamed to TimeNotSynced)
    TIME_NOT_SYNCED = 93
    SMS_CODE_FAILED = 94
    #  TOO_MANY_ACCOUNTS_ACCESS_THIS_RESOURCE = 95 # deprecated (renamed to AccountLimitExceeded)
    ACCOUNT_LIMIT_EXCEEDED          =  95
    ACCOUNT_ACTIVITY_LIMIT_EXCEEDED =  96
    PHONE_ACTIVITY_LIMIT_EXCEEDED   =  97
    REFUND_TO_WALLET                =  98
    EMAIL_SEND_FAILURE              =  99
    NOT_SETTLED                     = 100
    NEED_CAPTCHA                    = 101
    GSLT_DENIED                     = 102
    GS_OWNER_DENIED                 = 103
    INVALID_ITEM_TYPE               = 104
    IP_BANNED                       = 105
    GSLT_EXPIRED                    = 106
    INSUFFICIENT_FUNDS              = 107
    TOO_MANY_PENDING                = 108
    NO_SITE_LICENSES_FOUND          = 109
    WG_NETWORK_SEND_EXCEEDED        = 110
    ACCOUNT_NOT_FRIENDS             = 111
    LIMITED_USER_ACCOUNT            = 112
    CANT_REMOVE_ITEM                = 113
    #  ACCOUNT_HAS_BEEN_DELETED = 114 # deprecated (renamed to AccountDeleted)
    ACCOUNT_DELETED = 114
    #  ACCOUNT_HAS_AN_EXISTING_USER_CANCELLED_LICENSE = 115 # deprecated (renamed to ExistingUserCancelledLicense)
    EXISTING_USER_CANCELLED_LICENSE = 115
    #  DENIED_DUE_TO_COMMUNITY_COOLDOWN = 116 # deprecated (renamed to CommunityCooldown)
    COMMUNITY_COOLDOWN    = 116
    NO_LAUNCHER_SPECIFIED = 117
    MUST_AGREE_TO_SSA     = 118
    LAUNCHER_MIGRATED     = 119
    #  CURRENT_STEAM_REALM_DOES_NOT_MATCH = 120 # deprecated (renamed to SteamRealmMismatch)
    STEAM_REALM_MISMATCH = 120
    INVALID_SIGNATURE    = 121
    PARSE_FAILURE        = 122
    NO_VERIFIED_PHONE    = 123
  end
end
