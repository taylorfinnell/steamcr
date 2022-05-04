module Steamcr
  enum EUniverse
    def self.from_io(io, format)
      EUniverse.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID  = 0
    PUBLIC   = 1
    BETA     = 2
    INTERNAL = 3
    DEV      = 4
  end
end

module Steamcr
  enum EChatEntryType
    def self.from_io(io, format)
      EChatEntryType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID     = 0
    CHAT_MSG    = 1
    TYPING      = 2
    INVITE_GAME = 3
    #  EMOTE = 4 # deprecated (No longer supported by clients)
    #  LOBBY_GAME_START = 5 # deprecated (Listen for LobbyGameCreated_t callback instead)
    LEFT_CONVERSATION =  6
    ENTERED           =  7
    WAS_KICKED        =  8
    WAS_BANNED        =  9
    DISCONNECTED      = 10
    HISTORICAL_CHAT   = 11
    RESERVED1         = 12
    RESERVED2         = 13
    LINK_BLOCKED      = 14
  end
end

module Steamcr
  enum EPersonaState
    def self.from_io(io, format)
      EPersonaState.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    OFFLINE          = 0
    ONLINE           = 1
    BUSY             = 2
    AWAY             = 3
    SNOOZE           = 4
    LOOKING_TO_TRADE = 5
    LOOKING_TO_PLAY  = 6
    INVISIBLE        = 7
  end
end

module Steamcr
  enum EAccountType
    def self.from_io(io, format)
      EAccountType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID          =  0
    INDIVIDUAL       =  1
    MULTISEAT        =  2
    GAME_SERVER      =  3
    ANON_GAME_SERVER =  4
    PENDING          =  5
    CONTENT_SERVER   =  6
    CLAN             =  7
    CHAT             =  8
    CONSOLE_USER     =  9
    ANON_USER        = 10
  end
end

module Steamcr
  enum EFriendRelationship
    def self.from_io(io, format)
      EFriendRelationship.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE              = 0
    BLOCKED           = 1
    REQUEST_RECIPIENT = 2
    FRIEND            = 3
    REQUEST_INITIATOR = 4
    IGNORED           = 5
    IGNORED_FRIEND    = 6
    #  SUGGESTED_FRIEND = 7 # deprecated (was used by the original implementation of the facebook linking feature; but now unused.)
  end
end

module Steamcr
  enum EAccountFlags
    def self.from_io(io, format)
      EAccountFlags.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NORMAL_USER                   =          0
    PERSONA_NAME_SET              =          1
    UNBANNABLE                    =          2
    PASSWORD_SET                  =          4
    SUPPORT                       =          8
    ADMIN                         =         16
    SUPERVISOR                    =         32
    APP_EDITOR                    =         64
    HWID_SET                      =        128
    PERSONAL_QA_SET               =        256
    VAC_BETA                      =        512
    DEBUG                         =       1024
    DISABLED                      =       2048
    LIMITED_USER                  =       4096
    LIMITED_USER_FORCE            =       8192
    EMAIL_VALIDATED               =      16384
    MARKETING_TREATMENT           =      32768
    OGG_INVITE_OPT_OUT            =      65536
    FORCE_PASSWORD_CHANGE         =     131072
    FORCE_EMAIL_VERIFICATION      =     262144
    LOGON_EXTRA_SECURITY          =     524288
    LOGON_EXTRA_SECURITY_DISABLED =    1048576
    STEAM2_MIGRATION_COMPLETE     =    2097152
    NEED_LOGS                     =    4194304
    LOCKDOWN                      =    8388608
    MASTER_APP_EDITOR             =   16777216
    BANNED_FROM_WEB_API           =   33554432
    CLANS_ONLY_FROM_FRIENDS       =   67108864
    GLOBAL_MODERATOR              =  134217728
    PARENTAL_SETTINGS             =  268435456
    THIRD_PARTY_SUPPORT           =  536870912
    NEEDS_SSA_NEXT_STEAM_LOGON    = 1073741824
  end
end

module Steamcr
  enum EClanPermission
    def self.from_io(io, format)
      EClanPermission.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NOBODY                  = 0
    OWNER                   = 1
    OFFICER                 = 2
    OWNER_AND_OFFICER       = 3
    MEMBER                  = 4
    MODERATOR               = 8
    OWNER_OFFICER_MODERATOR = OWNER | OFFICER | MODERATOR
    ALL_MEMBERS             = OWNER | OFFICER | MODERATOR | MEMBER
    OGG_GAME_OWNER          =  16
    NON_MEMBER              = 128
    MEMBER_ALLOWED          = NON_MEMBER | MEMBER
    MODERATOR_ALLOWED       = NON_MEMBER | MEMBER | MODERATOR
    OFFICER_ALLOWED         = NON_MEMBER | MEMBER | MODERATOR | OFFICER
    OWNER_ALLOWED           = NON_MEMBER | MEMBER | MODERATOR | OFFICER | OWNER
    ANYBODY                 = NON_MEMBER | MEMBER | MODERATOR | OFFICER | OWNER
  end
end

module Steamcr
  enum EChatPermission
    def self.from_io(io, format)
      EChatPermission.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    CLOSE                        =   1
    INVITE                       =   2
    TALK                         =   8
    KICK                         =  16
    MUTE                         =  32
    SET_METADATA                 =  64
    CHANGE_PERMISSIONS           = 128
    BAN                          = 256
    CHANGE_ACCESS                = 512
    EVERYONE_NOT_IN_CLAN_DEFAULT = TALK
    EVERYONE_DEFAULT             = TALK | INVITE
    MEMBER_DEFAULT               = BAN | KICK | TALK | INVITE
    OFFICER_DEFAULT              = BAN | KICK | TALK | INVITE
    OWNER_DEFAULT                = CHANGE_ACCESS | BAN | SET_METADATA | MUTE | KICK | TALK | INVITE | CLOSE
    MASK                         = 1019
  end
end

module Steamcr
  enum EFriendFlags
    def self.from_io(io, format)
      EFriendFlags.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE                  =     0
    BLOCKED               =     1
    FRIENDSHIP_REQUESTED  =     2
    IMMEDIATE             =     4
    CLAN_MEMBER           =     8
    ON_GAME_SERVER        =    16
    REQUESTING_FRIENDSHIP =   128
    REQUESTING_INFO       =   256
    IGNORED               =   512
    IGNORED_FRIEND        =  1024
    SUGGESTED             =  2048
    CHAT_MEMBER           =  4096
    FLAG_ALL              = 65535
  end
end

module Steamcr
  enum EPersonaStateFlag
    def self.from_io(io, format)
      EPersonaStateFlag.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    HAS_RICH_PRESENCE    = 1
    IN_JOINABLE_GAME     = 2
    GOLDEN               = 4
    REMOTE_PLAY_TOGETHER = 8
    #  ONLINE_USING_WEB = 256 # deprecated (renamed to ClientTypeWeb)
    CLIENT_TYPE_WEB = 256
    #  ONLINE_USING_MOBILE = 512 # deprecated (renamed to ClientTypeMobile)
    CLIENT_TYPE_MOBILE = 512
    #  ONLINE_USING_BIG_PICTURE = 1024 # deprecated (renamed to ClientTypeTenfoot)
    CLIENT_TYPE_TENFOOT = 1024
    #  ONLINE_USING_VR = 2048 # deprecated (renamed to ClientTypeVR)
    CLIENT_TYPE_VR          = 2048
    LAUNCH_TYPE_GAMEPAD     = 4096
    LAUNCH_TYPE_COMPAT_TOOL = 8192
  end
end

module Steamcr
  enum EClientPersonaStateFlag
    def self.from_io(io, format)
      EClientPersonaStateFlag.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    STATUS      =  1
    PLAYER_NAME =  2
    QUERY_PORT  =  4
    SOURCE_ID   =  8
    PRESENCE    = 16
    #  METADATA = 32 # deprecated
    LAST_SEEN = 64
    #  CLAN_INFO = 128 # deprecated (renamed to UserClanRank)
    USER_CLAN_RANK  = 128
    GAME_EXTRA_INFO = 256
    GAME_DATA_BLOB  = 512
    #  CLAN_TAG = 1024 # deprecated (renamed to ClanData)
    CLAN_DATA     =  1024
    FACEBOOK      =  2048
    RICH_PRESENCE =  4096
    BROADCAST     =  8192
    WATCHING      = 16384
  end
end

module Steamcr
  enum EAppUsageEvent
    def self.from_io(io, format)
      EAppUsageEvent.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    GAME_LAUNCH              = 1
    GAME_LAUNCH_TRIAL        = 2
    MEDIA                    = 3
    PRELOAD_START            = 4
    PRELOAD_FINISH           = 5
    MARKETING_MESSAGE_VIEW   = 6
    IN_GAME_AD_VIEWED        = 7
    GAME_LAUNCH_FREE_WEEKEND = 8
  end
end

module Steamcr
  enum ELicenseFlags
    def self.from_io(io, format)
      ELicenseFlags.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE                             =    0
    RENEW                            =    1
    RENEWAL_FAILED                   =    2
    PENDING                          =    4
    EXPIRED                          =    8
    CANCELLED_BY_USER                =   16
    CANCELLED_BY_ADMIN               =   32
    LOW_VIOLENCE_CONTENT             =   64
    IMPORTED_FROM_STEAM2             =  128
    FORCE_RUN_RESTRICTION            =  256
    REGION_RESTRICTION_EXPIRED       =  512
    CANCELLED_BY_FRIENDLY_FRAUD_LOCK = 1024
    NOT_ACTIVATED                    = 2048
  end
end

module Steamcr
  enum ELicenseType
    def self.from_io(io, format)
      ELicenseType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NO_LICENSE                                 = 0
    SINGLE_PURCHASE                            = 1
    SINGLE_PURCHASE_LIMITED_USE                = 2
    RECURRING_CHARGE                           = 3
    RECURRING_CHARGE_LIMITED_USE               = 4
    RECURRING_CHARGE_LIMITED_USE_WITH_OVERAGES = 5
    RECURRING_OPTION                           = 6
    LIMITED_USE_DELAYED_ACTIVATION             = 7
  end
end

module Steamcr
  enum EPaymentMethod
    def self.from_io(io, format)
      EPaymentMethod.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE                   =  0
    ACTIVATION_CODE        =  1
    CREDIT_CARD            =  2
    GIROPAY                =  3
    PAY_PAL                =  4
    IDEAL                  =  5
    PAY_SAFE_CARD          =  6
    SOFORT                 =  7
    GUEST_PASS             =  8
    WEB_MONEY              =  9
    MONEY_BOOKERS          = 10
    ALI_PAY                = 11
    YANDEX                 = 12
    KIOSK                  = 13
    QIWI                   = 14
    GAME_STOP              = 15
    HARDWARE_PROMO         = 16
    MO_PAY                 = 17
    BOLETO_BANCARIO        = 18
    BOA_COMPRA_GOLD        = 19
    BANCO_DO_BRASIL_ONLINE = 20
    ITAU_ONLINE            = 21
    BRADESCO_ONLINE        = 22
    PAGSEGURO              = 23
    VISA_BRAZIL            = 24
    AMEX_BRAZIL            = 25
    AURA                   = 26
    HIPERCARD              = 27
    MASTERCARD_BRAZIL      = 28
    DINERS_CARD_BRAZIL     = 29
    AUTHORIZED_DEVICE      = 30
    MOL_POINTS             = 31
    CLICK_AND_BUY          = 32
    BEELINE                = 33
    KONBINI                = 34
    E_CLUB_POINTS          = 35
    CREDIT_CARD_JAPAN      = 36
    BANK_TRANSFER_JAPAN    = 37
    #  PAY_EASY_JAPAN = 38 # deprecated (renamed to PayEasy)
    PAY_EASY                 = 38
    ZONG                     = 39
    CULTURE_VOUCHER          = 40
    BOOK_VOUCHER             = 41
    HAPPYMONEY_VOUCHER       = 42
    CONVENIENT_STORE_VOUCHER = 43
    GAME_VOUCHER             = 44
    MULTIBANCO               = 45
    PAYSHOP                  = 46
    #  MAESTRO = 47 # deprecated (renamed to MaestroBoaCompra)
    MAESTRO_BOA_COMPRA    =  47
    OXXO                  =  48
    TODITO_CASH           =  49
    CARNET                =  50
    SPEI                  =  51
    THREE_PAY             =  52
    IS_BANK               =  53
    GARANTI               =  54
    AKBANK                =  55
    YAPI_KREDI            =  56
    HALKBANK              =  57
    BANK_ASYA             =  58
    FINANSBANK            =  59
    DENIZ_BANK            =  60
    PTT                   =  61
    CASH_U                =  62
    AUTO_GRANT            =  64
    WEB_MONEY_JAPAN       =  65
    ONE_CARD              =  66
    PSE                   =  67
    EXITO                 =  68
    EFECTY                =  69
    PALOTO                =  70
    PIN_VALIDDA           =  71
    MANGIR_KART           =  72
    BANCO_CREDITO_DE_PERU =  73
    BBVA_CONTINENTAL      =  74
    SAFETY_PAY            =  75
    PAGO_EFECTIVO         =  76
    TRUSTLY               =  77
    UNION_PAY             =  78
    BIT_COIN              =  79
    WALLET                = 128
    VALVE                 = 129
    #  STEAM_PRESS_MASTER = 130 # deprecated (renamed to MasterComp)
    MASTER_COMP = 130
    #  STORE_PROMOTION = 131 # deprecated (renamed to Promotional)
    PROMOTIONAL         =  131
    MASTER_SUBSCRIPTION =  134
    PAYCO               =  135
    MOBILE_WALLET_JAPAN =  136
    OEM_TICKET          =  256
    SPLIT               =  512
    COMPLIMENTARY       = 1024
  end
end

module Steamcr
  enum EPurchaseResultDetail
    def self.from_io(io, format)
      EPurchaseResultDetail.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NO_DETAIL                                   =  0
    AVS_FAILURE                                 =  1
    INSUFFICIENT_FUNDS                          =  2
    CONTACT_SUPPORT                             =  3
    TIMEOUT                                     =  4
    INVALID_PACKAGE                             =  5
    INVALID_PAYMENT_METHOD                      =  6
    INVALID_DATA                                =  7
    OTHERS_IN_PROGRESS                          =  8
    ALREADY_PURCHASED                           =  9
    WRONG_PRICE                                 = 10
    FRAUD_CHECK_FAILED                          = 11
    CANCELLED_BY_USER                           = 12
    RESTRICTED_COUNTRY                          = 13
    BAD_ACTIVATION_CODE                         = 14
    DUPLICATE_ACTIVATION_CODE                   = 15
    USE_OTHER_PAYMENT_METHOD                    = 16
    USE_OTHER_FUNCTION_SOURCE                   = 17
    INVALID_SHIPPING_ADDRESS                    = 18
    REGION_NOT_SUPPORTED                        = 19
    ACCT_IS_BLOCKED                             = 20
    ACCT_NOT_VERIFIED                           = 21
    INVALID_ACCOUNT                             = 22
    STORE_BILLING_COUNTRY_MISMATCH              = 23
    DOES_NOT_OWN_REQUIRED_APP                   = 24
    CANCELED_BY_NEW_TRANSACTION                 = 25
    FORCE_CANCELED_PENDING                      = 26
    FAIL_CURRENCY_TRANS_PROVIDER                = 27
    FAILED_CYBER_CAFE                           = 28
    NEEDS_PRE_APPROVAL                          = 29
    PRE_APPROVAL_DENIED                         = 30
    WALLET_CURRENCY_MISMATCH                    = 31
    EMAIL_NOT_VALIDATED                         = 32
    EXPIRED_CARD                                = 33
    TRANSACTION_EXPIRED                         = 34
    WOULD_EXCEED_MAX_WALLET                     = 35
    MUST_LOGIN_PS3_APP_FOR_PURCHASE             = 36
    CANNOT_SHIP_TO_PO_BOX                       = 37
    INSUFFICIENT_INVENTORY                      = 38
    CANNOT_GIFT_SHIPPED_GOODS                   = 39
    CANNOT_SHIP_INTERNATIONALLY                 = 40
    BILLING_AGREEMENT_CANCELLED                 = 41
    INVALID_COUPON                              = 42
    EXPIRED_COUPON                              = 43
    ACCOUNT_LOCKED                              = 44
    OTHER_ABORTABLE_IN_PROGRESS                 = 45
    EXCEEDED_STEAM_LIMIT                        = 46
    OVERLAPPING_PACKAGES_IN_CART                = 47
    NO_WALLET                                   = 48
    NO_CACHED_PAYMENT_METHOD                    = 49
    CANNOT_REDEEM_CODE_FROM_CLIENT              = 50
    PURCHASE_AMOUNT_NO_SUPPORTED_BY_PROVIDER    = 51
    OVERLAPPING_PACKAGES_IN_PENDING_TRANSACTION = 52
    RATE_LIMITED                                = 53
    OWNS_EXCLUDED_APP                           = 54
    CREDIT_CARD_BIN_MISMATCHES_TYPE             = 55
    CART_VALUE_TOO_HIGH                         = 56
    BILLING_AGREEMENT_ALREADY_EXISTS            = 57
    POSA_CODE_NOT_ACTIVATED                     = 58
    CANNOT_SHIP_TO_COUNTRY                      = 59
    HUNG_TRANSACTION_CANCELLED                  = 60
    PAYPAL_INTERNAL_ERROR                       = 61
    UNKNOWN_GLOBAL_COLLECT_ERROR                = 62
    INVALID_TAX_ADDRESS                         = 63
    PHYSICAL_PRODUCT_LIMIT_EXCEEDED             = 64
    PURCHASE_CANNOT_BE_REPLAYED                 = 65
    DELAYED_COMPLETION                          = 66
    BUNDLE_TYPE_CANNOT_BE_GIFTED                = 67
    BLOCKED_BY_US_GOV                           = 68
    ITEMS_RESERVED_FOR_COMMERCIAL_USE           = 69
    GIFT_ALREADY_OWNED                          = 70
    GIFT_INVALID_FOR_RECIPIENT_REGION           = 71
    GIFT_PRICING_IMBALANCE                      = 72
    GIFT_RECIPIENT_NOT_SPECIFIED                = 73
    ITEMS_NOT_ALLOWED_FOR_COMMERCIAL_USE        = 74
    BUSINESS_STORE_COUNTRY_CODE_MISMATCH        = 75
    USER_ASSOCIATED_WITH_MANY_CAFES             = 76
    USER_NOT_ASSOCIATED_WITH_CAFE               = 77
    ADDRESS_INVALID                             = 78
    CREDIT_CARD_NUMBER_INVALID                  = 79
    CANNOT_SHIP_TO_MILITARY_POST_OFFICE         = 80
    BILLING_NAME_INVALID_RESEMBLES_CREDIT_CARD  = 81
    PAYMENT_METHOD_TEMPORARILY_UNAVAILABLE      = 82
    PAYMENT_METHOD_NOT_SUPPORTED_FOR_PRODUCT    = 83
  end
end

module Steamcr
  enum EIntroducerRouting
    def self.from_io(io, format)
      EIntroducerRouting.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    #  FILE_SHARE = 0 # deprecated
    P2_P_VOICE_CHAT = 1
    P2_P_NETWORKING = 2
  end
end

module Steamcr
  enum EServerFlags
    def self.from_io(io, format)
      EServerFlags.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE       =  0
    ACTIVE     =  1
    SECURE     =  2
    DEDICATED  =  4
    LINUX      =  8
    PASSWORDED = 16
    PRIVATE    = 32
  end
end

module Steamcr
  enum EDenyReason
    def self.from_io(io, format)
      EDenyReason.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID_VERSION             =  1
    GENERIC                     =  2
    NOT_LOGGED_ON               =  3
    NO_LICENSE                  =  4
    CHEATER                     =  5
    LOGGED_IN_ELSE_WHERE        =  6
    UNKNOWN_TEXT                =  7
    INCOMPATIBLE_ANTICHEAT      =  8
    MEMORY_CORRUPTION           =  9
    INCOMPATIBLE_SOFTWARE       = 10
    STEAM_CONNECTION_LOST       = 11
    STEAM_CONNECTION_ERROR      = 12
    STEAM_RESPONSE_TIMED_OUT    = 13
    STEAM_VALIDATION_STALLED    = 14
    STEAM_OWNER_LEFT_GUEST_USER = 15
  end
end

module Steamcr
  enum EClanRank
    def self.from_io(io, format)
      EClanRank.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE      = 0
    OWNER     = 1
    OFFICER   = 2
    MEMBER    = 3
    MODERATOR = 4
  end
end

module Steamcr
  enum EClanRelationship
    def self.from_io(io, format)
      EClanRelationship.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE              = 0
    BLOCKED           = 1
    INVITED           = 2
    MEMBER            = 3
    KICKED            = 4
    KICK_ACKNOWLEDGED = 5
    PENDING_APPROVAL  = 6
    REQUEST_DENIED    = 7
  end
end

module Steamcr
  enum EAuthSessionResponse
    def self.from_io(io, format)
      EAuthSessionResponse.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    OK                               = 0
    USER_NOT_CONNECTED_TO_STEAM      = 1
    NO_LICENSE_OR_EXPIRED            = 2
    VAC_BANNED                       = 3
    LOGGED_IN_ELSE_WHERE             = 4
    VAC_CHECK_TIMED_OUT              = 5
    AUTH_TICKET_CANCELED             = 6
    AUTH_TICKET_INVALID_ALREADY_USED = 7
    AUTH_TICKET_INVALID              = 8
    PUBLISHER_ISSUED_BAN             = 9
  end
end

module Steamcr
  enum EChatRoomEnterResponse
    def self.from_io(io, format)
      EChatRoomEnterResponse.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    SUCCESS            =  1
    DOESNT_EXIST       =  2
    NOT_ALLOWED        =  3
    FULL               =  4
    ERROR              =  5
    BANNED             =  6
    LIMITED            =  7
    CLAN_DISABLED      =  8
    COMMUNITY_BAN      =  9
    MEMBER_BLOCKED_YOU = 10
    YOU_BLOCKED_MEMBER = 11
    #  NO_RANKING_DATA_LOBBY = 12 # deprecated
    #  NO_RANKING_DATA_USER = 13 # deprecated
    #  RANK_OUT_OF_RANGE = 14 # deprecated
  end
end

module Steamcr
  enum EChatRoomType
    def self.from_io(io, format)
      EChatRoomType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    FRIEND = 1
    MUC    = 2
    LOBBY  = 3
  end
end

module Steamcr
  enum EChatInfoType
    def self.from_io(io, format)
      EChatInfoType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    STATE_CHANGE        = 1
    INFO_UPDATE         = 2
    MEMBER_LIMIT_CHANGE = 3
  end
end

module Steamcr
  enum EChatAction
    def self.from_io(io, format)
      EChatAction.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVITE_CHAT              =  1
    KICK                     =  2
    BAN                      =  3
    UN_BAN                   =  4
    START_VOICE_SPEAK        =  5
    END_VOICE_SPEAK          =  6
    LOCK_CHAT                =  7
    UNLOCK_CHAT              =  8
    CLOSE_CHAT               =  9
    SET_JOINABLE             = 10
    SET_UNJOINABLE           = 11
    SET_OWNER                = 12
    SET_INVISIBLE_TO_FRIENDS = 13
    SET_VISIBLE_TO_FRIENDS   = 14
    SET_MODERATED            = 15
    SET_UNMODERATED          = 16
  end
end

module Steamcr
  enum EChatActionResult
    def self.from_io(io, format)
      EChatActionResult.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    SUCCESS                    =  1
    ERROR                      =  2
    NOT_PERMITTED              =  3
    NOT_ALLOWED_ON_CLAN_MEMBER =  4
    NOT_ALLOWED_ON_BANNED_USER =  5
    NOT_ALLOWED_ON_CHAT_OWNER  =  6
    NOT_ALLOWED_ON_SELF        =  7
    CHAT_DOESNT_EXIST          =  8
    CHAT_FULL                  =  9
    VOICE_SLOTS_FULL           = 10
  end
end

module Steamcr
  enum EAppInfoSection
    def self.from_io(io, format)
      EAppInfoSection.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    UNKNOWN  = 0
    ALL      = 1
    FIRST    = 2
    COMMON   = 2
    EXTENDED = 3
    CONFIG   = 4
    STATS    = 5
    INSTALL  = 6
    DEPOTS   = 7
    #  VAC = 8 # deprecated
    #  VAC_UNUSED = 8 # deprecated
    #  DRM = 9 # deprecated
    #  DRM_UNUSED = 9 # deprecated
    UFS = 10
    OGG = 11
    #  ITEMS = 12 # deprecated
    #  ITEMS_UNUSED = 12 # deprecated
    POLICIES          = 13
    SYS_REQS          = 14
    COMMUNITY         = 15
    STORE             = 16
    LOCALIZATION      = 17
    BROADCASTGAMEDATA = 18
    COMPUTED          = 19
    ALBUMMETADATA     = 20
  end
end

module Steamcr
  enum EContentDownloadSourceType
    def self.from_io(io, format)
      EContentDownloadSourceType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID     = 0
    CS          = 1
    CDN         = 2
    LCS         = 3
    PROXY_CACHE = 4
    LAN_PEER    = 5
    SLS         = 6
    STEAM_CACHE = 7
    OPEN_CACHE  = 8
    LAN_CACHE   = 9
  end
end

module Steamcr
  enum EPlatformType
    def self.from_io(io, format)
      EPlatformType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    UNKNOWN = 0
    WIN32   = 1
    WIN64   = 2
    #  LINUX = 3 # deprecated (split to Linux64 and Linux32)
    LINUX64 = 3
    OSX     = 4
    PS3     = 5
    LINUX32 = 6
  end
end

module Steamcr
  enum EOSType
    def self.from_io(io, format)
      EOSType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    UNKNOWN         =   -1
    WEB             = -700
    IOS_UNKNOWN     = -600
    IOS1            = -599
    IOS2            = -598
    IOS3            = -597
    IOS4            = -596
    IOS5            = -595
    IOS6            = -594
    IOS6_1          = -593
    IOS7            = -592
    IOS7_1          = -591
    IOS8            = -590
    IOS8_1          = -589
    IOS8_2          = -588
    IOS8_3          = -587
    IOS8_4          = -586
    IOS9            = -585
    IOS9_1          = -584
    IOS9_2          = -583
    IOS9_3          = -582
    IOS10           = -581
    IOS10_1         = -580
    IOS10_2         = -579
    IOS10_3         = -578
    IOS11           = -577
    IOS11_1         = -576
    IOS11_2         = -575
    IOS11_3         = -574
    IOS11_4         = -573
    IOS12           = -572
    IOS12_1         = -571
    ANDROID_UNKNOWN = -500
    ANDROID6        = -499
    ANDROID7        = -498
    ANDROID8        = -497
    ANDROID9        = -496
    UMQ             = -400
    PS3             = -300
    MAC_OS_UNKNOWN  = -102
    MAC_OS104       = -101
    MAC_OS105       = -100
    MAC_OS1058      =  -99
    MAC_OS106       =  -95
    MAC_OS1063      =  -94
    MAC_OS1064_SLGU =  -93
    MAC_OS1067      =  -92
    MAC_OS107       =  -90
    MAC_OS108       =  -89
    MAC_OS109       =  -88
    MAC_OS1010      =  -87
    MAC_OS1011      =  -86
    MAC_OS1012      =  -85
    MACOS1013       =  -84
    MACOS1014       =  -83
    MACOS1015       =  -82
    MAC_OS1016      =  -81
    MAC_OS11        =  -80
    MAC_OS111       =  -79
    MAC_OS1017      =  -78
    MAC_OS12        =  -77
    MAC_OS13        =  -76
    MAC_OS_MAX      =   -1
    LINUX_UNKNOWN   = -203
    LINUX22         = -202
    LINUX24         = -201
    LINUX26         = -200
    LINUX32         = -199
    LINUX35         = -198
    LINUX36         = -197
    LINUX310        = -196
    LINUX316        = -195
    LINUX318        = -194
    LINUX3X         = -193
    LINUX4X         = -192
    LINUX41         = -191
    LINUX44         = -190
    LINUX49         = -189
    LINUX414        = -188
    LINUX419        = -187
    LINUX5X         = -186
    LINUX54         = -185
    LINUX6X         = -184
    LINUX7X         = -183
    LINUX510        = -182
    LINUX_MAX       = -101
    WIN_UNKNOWN     =    0
    WIN311          =    1
    WIN95           =    2
    WIN98           =    3
    WIN_ME          =    4
    WIN_NT          =    5
    #  WIN200 = 6 # deprecated (renamed to Win2000)
    WIN2000   = 6
    WIN_XP    = 7
    WIN2003   = 8
    WIN_VISTA = 9
    #  WIN7 = 10 # deprecated (renamed to Windows7)
    WINDOWS7 = 10
    WIN2008  = 11
    WIN2012  = 12
    #  WIN8 = 13 # deprecated (renamed to Windows8)
    WINDOWS8 = 13
    #  WIN81 = 14 # deprecated (renamed to Windows81)
    WINDOWS81  = 14
    WIN2012_R2 = 15
    #  WIN10 = 16 # deprecated (renamed to Windows10)
    WINDOWS10 = 16
    WIN2016   = 17
    WIN2019   = 18
    WIN2022   = 19
    WIN11     = 20
    WIN_MAX   = 21
  end
end

module Steamcr
  enum EServerType
    def self.from_io(io, format)
      EServerType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    UTIL        = -2
    CLIENT      = -3
    C_SERVER    = -4
    C_ECON_BASE = -5
    INVALID     = -1
    FIRST       =  0
    SHELL       =  0
    GM          =  1
    #  BUM = 2 # deprecated
    #  BUMOBOSOLETE = 2 # deprecated
    AM  = 3
    BS  = 4
    VS  = 5
    ATS = 6
    CM  = 7
    FBS = 8
    #  FG = 9 # deprecated (renamed to BoxMonitor)
    BOX_MONITOR =  9
    SS          = 10
    DRMS        = 11
    #  HUB_OBSOLETE = 12 # deprecated
    CONSOLE = 13
    #  ASBOBSOLETE = 14 # deprecated
    PICS = 14
    #  CLIENT = 15 # deprecated
    #  BOOTSTRAP_OBSOLETE = 16 # deprecated
    CONTENT_STATS = 16
    DP            = 17
    WG            = 18
    SM            = 19
    SLC           = 20
    UFS           = 21
    #  UTIL = 23 # deprecated
    #  DSS = 24 # deprecated (renamed to Community)
    COMMUNITY = 24
    #  P2_P_RELAY_OBSOLETE = 25 # deprecated
    APP_INFORMATION = 26
    SPARE           = 27
    FTS             = 28
    #  EPM = 29 # deprecated
    #  EPMOBSOLETE = 29 # deprecated
    SITE_LICENSE = 29
    PS           = 30
    IS           = 31
    CCS          = 32
    DFS          = 33
    LBS          = 34
    MDS          = 35
    CS           = 36
    GC           = 37
    NS           = 38
    OGS          = 39
    WEB_API      = 40
    UDS          = 41
    MMS          = 42
    GMS          = 43
    KGS          = 44
    UCM          = 45
    RM           = 46
    FS           = 47
    ECON         = 48
    BACKPACK     = 49
    UGS          = 50
    #  STORE = 51 # deprecated (renamed to StoreFeature)
    STORE_FEATURE         =  51
    MONEY_STATS           =  52
    CRE                   =  53
    UMQ                   =  54
    WORKSHOP              =  55
    BRP                   =  56
    GCH                   =  57
    MPAS                  =  58
    TRADE                 =  59
    SECRETS               =  60
    LOGSINK               =  61
    MARKET                =  62
    QUEST                 =  63
    WDS                   =  64
    ACS                   =  65
    PNP                   =  66
    TAX_FORM              =  67
    EXTERNAL_MONITOR      =  68
    PARENTAL              =  69
    PARTNER_UPLOAD        =  70
    PARTNER               =  71
    ES                    =  72
    DEPOT_WEB_CONTENT     =  73
    EXTERNAL_CONFIG       =  74
    GAME_NOTIFICATIONS    =  75
    MARKET_REPL           =  76
    MARKET_SEARCH         =  77
    LOCALIZATION          =  78
    STEAM2_EMULATOR       =  79
    PUBLIC_TEST           =  80
    SOLR_MGR              =  81
    BROADCAST_RELAY       =  82
    BROADCAST_DIRECTORY   =  83
    VIDEO_MANAGER         =  84
    TRADE_OFFER           =  85
    BROADCAST_CHAT        =  86
    PHONE                 =  87
    ACCOUNT_SCORE         =  88
    SUPPORT               =  89
    LOG_REQUEST           =  90
    LOG_WORKER            =  91
    EMAIL_DELIVERY        =  92
    INVENTORY_MANAGEMENT  =  93
    AUTH                  =  94
    STORE_CATALOG         =  95
    HLTV_RELAY            =  96
    IDLS                  =  97
    PERF                  =  98
    ITEM_INVENTORY        =  99
    WATCHDOG              = 100
    ACCOUNT_HISTORY       = 101
    CHAT                  = 102
    SHADER                = 103
    ACCOUNT_HARDWARE      = 104
    WEB_RTC               = 105
    GIVEAWAY              = 106
    CHAT_ROOM             = 107
    VOICE_CHAT            = 108
    QMS                   = 109
    TRUST                 = 110
    TIME_MACHINE          = 111
    VACDB_MASTER          = 112
    CONTENT_SERVER_CONFIG = 113
    MINIGAME              = 114
    ML_TRAIN              = 115
    VAC_TEST              = 116
    TAX_SERVICE           = 117
    ML_INFERENCE          = 118
    UGS_AGGREGATE         = 119
    TURN                  = 120
    REMOTE_CLIENT         = 121
    BROADCAST_ORIGIN      = 122
    BROADCAST_CHANNEL     = 123
    STEAM_AR              = 124
    CHINA                 = 125
    CRASH_DUMP            = 126
  end
end

module Steamcr
  enum EBillingType
    def self.from_io(io, format)
      EBillingType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NO_COST                   =  0
    BILL_ONCE_ONLY            =  1
    BILL_MONTHLY              =  2
    PROOF_OF_PREPURCHASE_ONLY =  3
    GUEST_PASS                =  4
    HARDWARE_PROMO            =  5
    GIFT                      =  6
    AUTO_GRANT                =  7
    OEM_TICKET                =  8
    RECURRING_OPTION          =  9
    BILL_ONCE_OR_CD_KEY       = 10
    REPURCHASEABLE            = 11
    FREE_ON_DEMAND            = 12
    RENTAL                    = 13
    COMMERCIAL_LICENSE        = 14
    FREE_COMMERCIAL_LICENSE   = 15
    NUM_BILLING_TYPES         = 16
  end
end

module Steamcr
  enum EPackageStatus
    def self.from_io(io, format)
      EPackageStatus.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    AVAILABLE   = 0
    PREORDER    = 1
    UNAVAILABLE = 2
    INVALID     = 3
  end
end

module Steamcr
  enum EActivationCodeClass : UInt32
    def self.from_io(io, format)
      EActivationCodeClass.new(io.read_bytes(UInt32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    WON_CD_KEY    =          0
    VALVE_CD_KEY  =          1
    DOOM3_CD_KEY  =          2
    DB_LOOKUP     =          3
    STEAM2010_KEY =          4
    MAX           =          5
    TEST          = 2147483647
    INVALID       = 4294967295
  end
end

module Steamcr
  enum EChatMemberStateChange
    def self.from_io(io, format)
      EChatMemberStateChange.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    ENTERED             =    1
    LEFT                =    2
    DISCONNECTED        =    4
    KICKED              =    8
    BANNED              =   16
    VOICE_SPEAKING      = 4096
    VOICE_DONE_SPEAKING = 8192
  end
end

module Steamcr
  enum ERegionCode : UInt8
    def self.from_io(io, format)
      ERegionCode.new(io.read_bytes(UInt8))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    US_EAST       =   0
    US_WEST       =   1
    SOUTH_AMERICA =   2
    EUROPE        =   3
    ASIA          =   4
    AUSTRALIA     =   5
    MIDDLE_EAST   =   6
    AFRICA        =   7
    WORLD         = 255
  end
end

module Steamcr
  enum ECurrencyCode
    def self.from_io(io, format)
      ECurrencyCode.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID =  0
    USD     =  1
    GBP     =  2
    EUR     =  3
    CHF     =  4
    RUB     =  5
    PLN     =  6
    BRL     =  7
    JPY     =  8
    NOK     =  9
    IDR     = 10
    MYR     = 11
    PHP     = 12
    SGD     = 13
    THB     = 14
    VND     = 15
    KRW     = 16
    TRY     = 17
    UAH     = 18
    MXN     = 19
    CAD     = 20
    AUD     = 21
    NZD     = 22
    CNY     = 23
    INR     = 24
    CLP     = 25
    PEN     = 26
    COP     = 27
    ZAR     = 28
    HKD     = 29
    TWD     = 30
    SAR     = 31
    AED     = 32
    ARS     = 34
    ILS     = 35
    BYN     = 36
    KZT     = 37
    KWD     = 38
    QAR     = 39
    CRC     = 40
    UYU     = 41
  end
end

module Steamcr
  enum EDepotFileFlag
    def self.from_io(io, format)
      EDepotFileFlag.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    USER_CONFIG           =   1
    VERSIONED_USER_CONFIG =   2
    ENCRYPTED             =   4
    READ_ONLY             =   8
    HIDDEN                =  16
    EXECUTABLE            =  32
    DIRECTORY             =  64
    CUSTOM_EXECUTABLE     = 128
    INSTALL_SCRIPT        = 256
    SYMLINK               = 512
  end
end

module Steamcr
  enum EWorkshopEnumerationType
    def self.from_io(io, format)
      EWorkshopEnumerationType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    RANKED_BY_VOTE             = 0
    RECENT                     = 1
    TRENDING                   = 2
    FAVORITE_OF_FRIENDS        = 3
    VOTED_BY_FRIENDS           = 4
    CONTENT_BY_FRIENDS         = 5
    RECENT_FROM_FOLLOWED_USERS = 6
  end
end

module Steamcr
  enum EPublishedFileVisibility
    def self.from_io(io, format)
      EPublishedFileVisibility.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    PUBLIC       = 0
    FRIENDS_ONLY = 1
    PRIVATE      = 2
  end
end

module Steamcr
  enum EWorkshopFileType
    def self.from_io(io, format)
      EWorkshopFileType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    FIRST                    =  0
    COMMUNITY                =  0
    MICROTRANSACTION         =  1
    COLLECTION               =  2
    ART                      =  3
    VIDEO                    =  4
    SCREENSHOT               =  5
    GAME                     =  6
    SOFTWARE                 =  7
    CONCEPT                  =  8
    WEB_GUIDE                =  9
    INTEGRATED_GUIDE         = 10
    MERCH                    = 11
    CONTROLLER_BINDING       = 12
    STEAMWORKS_ACCESS_INVITE = 13
    STEAM_VIDEO              = 14
    GAME_MANAGED_ITEM        = 15
  end
end

module Steamcr
  enum EWorkshopFileAction
    def self.from_io(io, format)
      EWorkshopFileAction.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    PLAYED    = 0
    COMPLETED = 1
  end
end

module Steamcr
  enum EEconTradeResponse
    def self.from_io(io, format)
      EEconTradeResponse.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    ACCEPTED                                        =  0
    DECLINED                                        =  1
    TRADE_BANNED_INITIATOR                          =  2
    TRADE_BANNED_TARGET                             =  3
    TARGET_ALREADY_TRADING                          =  4
    DISABLED                                        =  5
    NOT_LOGGED_IN                                   =  6
    CANCEL                                          =  7
    TOO_SOON                                        =  8
    TOO_SOON_PENALTY                                =  9
    CONNECTION_FAILED                               = 10
    ALREADY_TRADING                                 = 11
    ALREADY_HAS_TRADE_REQUEST                       = 12
    NO_RESPONSE                                     = 13
    CYBER_CAFE_INITIATOR                            = 14
    CYBER_CAFE_TARGET                               = 15
    SCHOOL_LAB_INITIATOR                            = 16
    SCHOOL_LAB_TARGET                               = 16
    INITIATOR_BLOCKED_TARGET                        = 18
    INITIATOR_NEEDS_VERIFIED_EMAIL                  = 20
    INITIATOR_NEEDS_STEAM_GUARD                     = 21
    TARGET_ACCOUNT_CANNOT_TRADE                     = 22
    INITIATOR_STEAM_GUARD_DURATION                  = 23
    INITIATOR_PASSWORD_RESET_PROBATION              = 24
    INITIATOR_NEW_DEVICE_COOLDOWN                   = 25
    INITIATOR_SENT_INVALID_COOKIE                   = 26
    NEEDS_EMAIL_CONFIRMATION                        = 27
    INITIATOR_RECENT_EMAIL_CHANGE                   = 28
    NEEDS_MOBILE_CONFIRMATION                       = 29
    TRADING_HOLD_FOR_CLEARED_TRADE_OFFERS_INITIATOR = 30
    WOULD_EXCEED_MAX_ASSET_COUNT                    = 31
    DISABLED_IN_REGION                              = 32
    DISABLED_IN_PARTNER_REGION                      = 33
    OK_TO_DELIVER                                   = 50
  end
end

module Steamcr
  enum EMarketingMessageFlags
    def self.from_io(io, format)
      EMarketingMessageFlags.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE                  = 0
    HIGH_PRIORITY         = 1
    PLATFORM_WINDOWS      = 2
    PLATFORM_MAC          = 4
    PLATFORM_LINUX        = 8
    PLATFORM_RESTRICTIONS = PLATFORM_WINDOWS | PLATFORM_MAC | PLATFORM_LINUX
  end
end

module Steamcr
  enum ENewsUpdateType
    def self.from_io(io, format)
      ENewsUpdateType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    APP_NEWS      = 0
    STEAM_ADS     = 1
    STEAM_NEWS    = 2
    CDDB_UPDATE   = 3
    CLIENT_UPDATE = 4
  end
end

module Steamcr
  enum ESystemIMType
    def self.from_io(io, format)
      ESystemIMType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    RAW_TEXT                    = 0
    INVALID_CARD                = 1
    RECURRING_PURCHASE_FAILED   = 2
    CARD_WILL_EXPIRE            = 3
    SUBSCRIPTION_EXPIRED        = 4
    GUEST_PASS_RECEIVED         = 5
    GUEST_PASS_GRANTED          = 6
    GIFT_REVOKED                = 7
    SUPPORT_MESSAGE             = 8
    SUPPORT_MESSAGE_CLEAR_ALERT = 9
  end
end

module Steamcr
  enum EChatFlags
    def self.from_io(io, format)
      EChatFlags.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    LOCKED               = 1
    INVISIBLE_TO_FRIENDS = 2
    MODERATED            = 4
    UNJOINABLE           = 8
  end
end

module Steamcr
  enum ERemoteStoragePlatform
    def self.from_io(io, format)
      ERemoteStoragePlatform.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE       =  0
    WINDOWS    =  1
    OSX        =  2
    PS3        =  4
    LINUX      =  8
    SWITCH     = 16
    ANDROID    = 32
    I_PHONE_OS = 64
    ALL        = -1
  end
end

module Steamcr
  enum EDRMBlobDownloadType
    def self.from_io(io, format)
      EDRMBlobDownloadType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    ERROR         =  0
    FILE          =  1
    PARTS         =  2
    COMPRESSED    =  4
    ALL_MASK      =  7
    IS_JOB        =  8
    HIGH_PRIORITY = 16
    ADD_TIMESTAMP = 32
    LOW_PRIORITY  = 64
  end
end

module Steamcr
  enum EDRMBlobDownloadErrorDetail
    def self.from_io(io, format)
      EDRMBlobDownloadErrorDetail.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE                         =      0
    DOWNLOAD_FAILED              =      1
    TARGET_LOCKED                =      2
    OPEN_ZIP                     =      3
    READ_ZIP_DIRECTORY           =      4
    UNEXPECTED_ZIP_ENTRY         =      5
    UNZIP_FULL_FILE              =      6
    UNKNOWN_BLOB_TYPE            =      7
    UNZIP_STRIPS                 =      8
    UNZIP_MERGE_GUID             =      9
    UNZIP_SIGNATURE              =     10
    APPLY_STRIPS                 =     11
    APPLY_MERGE_GUID             =     12
    APPLY_SIGNATURE              =     13
    APP_ID_MISMATCH              =     14
    APP_ID_UNEXPECTED            =     15
    APPLIED_SIGNATURE_CORRUPT    =     16
    APPLY_VALVE_SIGNATURE_HEADER =     17
    UNZIP_VALVE_SIGNATURE_HEADER =     18
    PATH_MANIPULATION_ERROR      =     19
    TARGET_LOCKED_BASE           =  65536
    TARGET_LOCKED_MAX            = 131071
    NEXT_BASE                    = 131072
  end
end

module Steamcr
  enum EClientStat
    def self.from_io(io, format)
      EClientStat.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    P2_P_CONNECTIONS_UDP   = 0
    P2_P_CONNECTIONS_RELAY = 1
    P2_P_GAME_CONNECTIONS  = 2
    P2_P_VOICE_CONNECTIONS = 3
    BYTES_DOWNLOADED       = 4
  end
end

module Steamcr
  enum EClientStatAggregateMethod
    def self.from_io(io, format)
      EClientStatAggregateMethod.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    LATEST_ONLY = 0
    SUM         = 1
    EVENT       = 2
    SCALAR      = 3
  end
end

module Steamcr
  enum ELeaderboardDataRequest
    def self.from_io(io, format)
      ELeaderboardDataRequest.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    GLOBAL             = 0
    GLOBAL_AROUND_USER = 1
    FRIENDS            = 2
    USERS              = 3
  end
end

module Steamcr
  enum ELeaderboardSortMethod
    def self.from_io(io, format)
      ELeaderboardSortMethod.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE       = 0
    ASCENDING  = 1
    DESCENDING = 2
  end
end

module Steamcr
  enum ELeaderboardDisplayType
    def self.from_io(io, format)
      ELeaderboardDisplayType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE               = 0
    NUMERIC            = 1
    TIME_SECONDS       = 2
    TIME_MILLI_SECONDS = 3
  end
end

module Steamcr
  enum ELeaderboardUploadScoreMethod
    def self.from_io(io, format)
      ELeaderboardUploadScoreMethod.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE         = 0
    KEEP_BEST    = 1
    FORCE_UPDATE = 2
  end
end

module Steamcr
  enum EUCMFilePrivacyState
    def self.from_io(io, format)
      EUCMFilePrivacyState.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID      = -1
    PRIVATE      =  2
    FRIENDS_ONLY =  4
    PUBLIC       =  8
    ALL          = PUBLIC | FRIENDS_ONLY | PRIVATE
  end
end

module Steamcr
  enum EPublishedFileQueryType
    def self.from_io(io, format)
      EPublishedFileQueryType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    RANKED_BY_VOTE                                       =  0
    RANKED_BY_PUBLICATION_DATE                           =  1
    ACCEPTED_FOR_GAME_RANKED_BY_ACCEPTANCE_DATE          =  2
    RANKED_BY_TREND                                      =  3
    FAVORITED_BY_FRIENDS_RANKED_BY_PUBLICATION_DATE      =  4
    CREATED_BY_FRIENDS_RANKED_BY_PUBLICATION_DATE        =  5
    RANKED_BY_NUM_TIMES_REPORTED                         =  6
    CREATED_BY_FOLLOWED_USERS_RANKED_BY_PUBLICATION_DATE =  7
    NOT_YET_RATED                                        =  8
    RANKED_BY_TOTAL_UNIQUE_SUBSCRIPTIONS                 =  9
    RANKED_BY_TOTAL_VOTES_ASC                            = 10
    RANKED_BY_VOTES_UP                                   = 11
    RANKED_BY_TEXT_SEARCH                                = 12
    RANKED_BY_PLAYTIME_TREND                             = 13
    RANKED_BY_TOTAL_PLAYTIME                             = 14
    RANKED_BY_AVERAGE_PLAYTIME_TREND                     = 15
    RANKED_BY_LIFETIME_AVERAGE_PLAYTIME                  = 16
    RANKED_BY_PLAYTIME_SESSIONS_TREND                    = 17
    RANKED_BY_LIFETIME_PLAYTIME_SESSIONS                 = 18
    RANKED_BY_INAPPROPRIATE_CONTENT_RATING               = 19
  end
end

module Steamcr
  enum EPublishedFileInappropriateProvider
    def self.from_io(io, format)
      EPublishedFileInappropriateProvider.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID = 0
    GOOGLE  = 1
    AMAZON  = 2
  end
end

module Steamcr
  enum EPublishedFileInappropriateResult
    def self.from_io(io, format)
      EPublishedFileInappropriateResult.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NOT_SCANNED   =   0
    VERY_UNLIKELY =   1
    UNLIKELY      =  30
    POSSIBLE      =  50
    LIKELY        =  75
    VERY_LIKELY   = 100
  end
end

module Steamcr
  enum EDisplayStatus
    def self.from_io(io, format)
      EDisplayStatus.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID           =  0
    LAUNCHING         =  1
    UNINSTALLING      =  2
    INSTALLING        =  3
    RUNNING           =  4
    VALIDATING        =  5
    UPDATING          =  6
    DOWNLOADING       =  7
    SYNCHRONIZING     =  8
    READY_TO_INSTALL  =  9
    READY_TO_PRELOAD  = 10
    READY_TO_LAUNCH   = 11
    REGION_RESTRICTED = 12
    PRESALE_ONLY      = 13
    INVALID_PLATFORM  = 14
    PARENTAL_BLOCKED  = 15
    PRELOAD_ONLY      = 16
    BORROWER_LOCKED   = 17
    UPDATE_PAUSED     = 18
    UPDATE_QUEUED     = 19
    UPDATE_REQUIRED   = 20
    UPDATE_DISABLED   = 21
    DOWNLOAD_PAUSED   = 22
    DOWNLOAD_QUEUED   = 23
    DOWNLOAD_REQUIRED = 24
    DOWNLOAD_DISABLED = 25
    LICENSE_PENDING   = 26
    LICENSE_EXPIRED   = 27
    AVAIL_FOR_FREE    = 28
    AVAIL_TO_BORROW   = 29
    AVAIL_GUEST_PASS  = 30
    PURCHASE          = 31
  end
end

module Steamcr
  enum EAppType
    def self.from_io(io, format)
      EAppType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID     =          0
    GAME        =          1
    APPLICATION =          2
    TOOL        =          4
    DEMO        =          8
    DEPRECTED   =         16
    DLC         =         32
    GUIDE       =         64
    DRIVER      =        128
    CONFIG      =        256
    HARDWARE    =        512
    FRANCHISE   =       1024
    VIDEO       =       2048
    PLUGIN      =       4096
    MUSIC       =       8192
    SERIES      =      16384
    COMIC       =      32768
    BETA        =      65536
    SHORTCUT    = 1073741824
    #  DEPOT_ONLY = -2147483648 # deprecated
  end
end

module Steamcr
  enum EChatRoomGroupType
    def self.from_io(io, format)
      EChatRoomGroupType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    DEFAULT     = 0
    UNMODERATED = 1
  end
end

module Steamcr
  enum EChatroomNotificationLevel
    def self.from_io(io, format)
      EChatroomNotificationLevel.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID      = 0
    NONE         = 1
    MENTION_ME   = 2
    MENTION_ALL  = 3
    ALL_MESSAGES = 4
  end
end

module Steamcr
  enum EChatRoomMemberStateChange
    def self.from_io(io, format)
      EChatRoomMemberStateChange.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID          =  0
    JOINED           =  1
    PARTED           =  2
    KICKED           =  3
    INVITED          =  4
    RANK_CHANGED     =  7
    INVITE_DISMISSED =  8
    MUTED            =  9
    BANNED           = 10
    ROLES_CHANGED    = 12
  end
end

module Steamcr
  enum EChatRoomServerMsg
    def self.from_io(io, format)
      EChatRoomServerMsg.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID                   =  0
    RENAME_CHAT_ROOM          =  1
    JOINED                    =  2
    PARTED                    =  3
    KICKED                    =  4
    INVITED                   =  5
    INVITE_DISMISSED          =  8
    CHAT_ROOM_TAGLINE_CHANGED =  9
    CHAT_ROOM_AVATAR_CHANGED  = 10
    APP_CUSTOM                = 11
  end
end

module Steamcr
  enum EChatRoomGroupRank
    def self.from_io(io, format)
      EChatRoomGroupRank.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    DEFAULT   =  0
    VIEWER    = 10
    GUEST     = 15
    MEMBER    = 20
    MODERATOR = 30
    OFFICER   = 40
    OWNER     = 50
  end
end

module Steamcr
  enum EChatRoomGroupPermissions
    def self.from_io(io, format)
      EChatRoomGroupPermissions.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    DEFAULT           =  0
    VALID             =  1
    CAN_INVITE        =  2
    CAN_KICK          =  4
    CAN_BAN           =  8
    CAN_ADMIN_CHANNEL = 16
  end
end

module Steamcr
  enum EChatRoomGroupAction
    def self.from_io(io, format)
      EChatRoomGroupAction.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    DEFAULT                      =  0
    CREATE_RENAME_DELETE_CHANNEL =  1
    KICK                         =  2
    BAN                          =  3
    INVITE                       =  4
    CHANGE_TAGLINE_AVATAR_NAME   =  5
    CHAT                         =  6
    VIEW_HISTORY                 =  7
    CHANGE_GROUP_ROLES           =  8
    CHANGE_USER_ROLES            =  9
    MENTION_ALL                  = 10
    SET_WATCHING_BROADCAST       = 11
  end
end

module Steamcr
  enum EChatRoomJoinState
    def self.from_io(io, format)
      EChatRoomJoinState.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    DEFAULT = 0
    NONE    = 1
    JOINED  = 2
  end
end

module Steamcr
  enum EVoiceCallState
    def self.from_io(io, format)
      EVoiceCallState.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    NONE                                       = 0
    SCHEDULED_INITIATE                         = 1
    REQUESTED_MIC_ACCESS                       = 2
    LOCAL_MIC_ONLY                             = 3
    CREATE_PEER_CONNECTION                     = 4
    INITATED_WEB_RTC_SESSION                   = 5
    WEB_RTC_CONNECTED_WAITING_ON_ICE_CONNECTED = 6
    REQUESTED_PERMISSION                       = 7
    NOTIFYING_VOICE_CHAT_OF_WEB_RTC_SESSION    = 8
    CONNECTED                                  = 9
  end
end

module Steamcr
  enum ETradeOfferState
    def self.from_io(io, format)
      ETradeOfferState.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID                    =  1
    ACTIVE                     =  2
    ACCEPTED                   =  3
    COUNTERED                  =  4
    EXPIRED                    =  5
    CANCELED                   =  6
    DECLINED                   =  7
    INVALID_ITEMS              =  8
    CREATED_NEEDS_CONFIRMATION =  9
    CANCELED_BY_SECOND_FACTOR  = 10
    IN_ESCROW                  = 11
  end
end

module Steamcr
  enum ETradeOfferConfirmationMethod
    def self.from_io(io, format)
      ETradeOfferConfirmationMethod.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID    = 0
    EMAIL      = 1
    MOBILE_APP = 2
  end
end

module Steamcr
  enum ELobbyType
    def self.from_io(io, format)
      ELobbyType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    PRIVATE        = 0
    FRIENDS_ONLY   = 1
    PUBLIC         = 2
    INVISIBLE      = 3
    PRIVATE_UNIQUE = 4
  end
end

module Steamcr
  enum ELobbyFilterType
    def self.from_io(io, format)
      ELobbyFilterType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    STRING          = 0
    NUMERICAL       = 1
    SLOTS_AVAILABLE = 2
    NEAR_VALUE      = 3
    DISTANCE        = 4
  end
end

module Steamcr
  enum ELobbyComparison
    def self.from_io(io, format)
      ELobbyComparison.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    EQUAL_TO_OR_LESS_THAN    = -2
    LESS_THAN                = -1
    EQUAL                    =  0
    GREATER_THAN             =  1
    EQUAL_TO_OR_GREATER_THAN =  2
    NOT_EQUAL                =  3
  end
end

module Steamcr
  enum ELobbyDistanceFilter
    def self.from_io(io, format)
      ELobbyDistanceFilter.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    CLOSE     = 0
    DEFAULT   = 1
    FAR       = 2
    WORLDWIDE = 3
  end
end

module Steamcr
  enum ESteamIPv6ConnectivityProtocol
    def self.from_io(io, format)
      ESteamIPv6ConnectivityProtocol.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    INVALID = 0
    HTTP    = 1
    UDP     = 2
  end
end

module Steamcr
  enum ESteamIPv6ConnectivityState
    def self.from_io(io, format)
      ESteamIPv6ConnectivityState.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    UNKNOWN = 0
    GOOD    = 1
    BAD     = 2
  end
end

module Steamcr
  enum ESteamRealm
    def self.from_io(io, format)
      ESteamRealm.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    UNKNOWN      = 0
    STEAM_GLOBAL = 1
    STEAM_CHINA  = 2
  end
end

module Steamcr
  enum ELauncherType
    def self.from_io(io, format)
      ELauncherType.new(io.read_bytes(Int32))
    end

    def to_io(io, format)
      format.encode(self.value, io)
    end

    DEFAULT       = 0
    PERFECT_WORLD = 1
    NEXON         = 2
    CMD_LINE      = 3
    CSGO          = 4
    CLIENT_UI     = 5
    HEADLESS      = 6
    STEAM_CHINA   = 7
    SINGLE_APP    = 8
  end
end
