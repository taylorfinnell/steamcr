## Generated from gcsystemmsgs.proto
require "protobuf"

module Csgo
  enum EGCSystemMsg
    KEGCMsgInvalid = 0
    KEGCMsgMulti = 1
    KEGCMsgGenericReply = 10
    KEGCMsgSystemBase = 50
    KEGCMsgAchievementAwarded = 51
    KEGCMsgConCommand = 52
    KEGCMsgStartPlaying = 53
    KEGCMsgStopPlaying = 54
    KEGCMsgStartGameserver = 55
    KEGCMsgStopGameserver = 56
    KEGCMsgWGRequest = 57
    KEGCMsgWGResponse = 58
    KEGCMsgGetUserGameStatsSchema = 59
    KEGCMsgGetUserGameStatsSchemaResponse = 60
    KEGCMsgGetUserStatsDEPRECATED = 61
    KEGCMsgGetUserStatsResponse = 62
    KEGCMsgAppInfoUpdated = 63
    KEGCMsgValidateSession = 64
    KEGCMsgValidateSessionResponse = 65
    KEGCMsgLookupAccountFromInput = 66
    KEGCMsgSendHTTPRequest = 67
    KEGCMsgSendHTTPRequestResponse = 68
    KEGCMsgPreTestSetup = 69
    KEGCMsgRecordSupportAction = 70
    KEGCMsgGetAccountDetailsDEPRECATED = 71
    KEGCMsgReceiveInterAppMessage = 73
    KEGCMsgFindAccounts = 74
    KEGCMsgPostAlert = 75
    KEGCMsgGetLicenses = 76
    KEGCMsgGetUserStats = 77
    KEGCMsgGetCommands = 78
    KEGCMsgGetCommandsResponse = 79
    KEGCMsgAddFreeLicense = 80
    KEGCMsgAddFreeLicenseResponse = 81
    KEGCMsgGetIPLocation = 82
    KEGCMsgGetIPLocationResponse = 83
    KEGCMsgSystemStatsSchema = 84
    KEGCMsgGetSystemStats = 85
    KEGCMsgGetSystemStatsResponse = 86
    KEGCMsgSendEmail = 87
    KEGCMsgSendEmailResponse = 88
    KEGCMsgGetEmailTemplate = 89
    KEGCMsgGetEmailTemplateResponse = 90
    KEGCMsgGrantGuestPass = 91
    KEGCMsgGrantGuestPassResponse = 92
    KEGCMsgGetAccountDetails = 93
    KEGCMsgGetAccountDetailsResponse = 94
    KEGCMsgGetPersonaNames = 95
    KEGCMsgGetPersonaNamesResponse = 96
    KEGCMsgMultiplexMsg = 97
    KEGCMsgMultiplexMsgResponse = 98
    KEGCMsgWebAPIRegisterInterfaces = 101
    KEGCMsgWebAPIJobRequest = 102
    KEGCMsgWebAPIJobRequestHttpResponse = 104
    KEGCMsgWebAPIJobRequestForwardResponse = 105
    KEGCMsgMemCachedGet = 200
    KEGCMsgMemCachedGetResponse = 201
    KEGCMsgMemCachedSet = 202
    KEGCMsgMemCachedDelete = 203
    KEGCMsgMemCachedStats = 204
    KEGCMsgMemCachedStatsResponse = 205
    KEGCMsgMasterSetDirectory = 220
    KEGCMsgMasterSetDirectoryResponse = 221
    KEGCMsgMasterSetWebAPIRouting = 222
    KEGCMsgMasterSetWebAPIRoutingResponse = 223
    KEGCMsgMasterSetClientMsgRouting = 224
    KEGCMsgMasterSetClientMsgRoutingResponse = 225
    KEGCMsgSetOptions = 226
    KEGCMsgSetOptionsResponse = 227
    KEGCMsgSystemBase2 = 500
    KEGCMsgGetPurchaseTrustStatus = 501
    KEGCMsgGetPurchaseTrustStatusResponse = 502
    KEGCMsgUpdateSession = 503
    KEGCMsgGCAccountVacStatusChange = 504
    KEGCMsgCheckFriendship = 505
    KEGCMsgCheckFriendshipResponse = 506
    KEGCMsgGetPartnerAccountLink = 507
    KEGCMsgGetPartnerAccountLinkResponse = 508
    KEGCMsgDPPartnerMicroTxns = 512
    KEGCMsgDPPartnerMicroTxnsResponse = 513
    KEGCMsgVacVerificationChange = 518
    KEGCMsgAccountPhoneNumberChange = 519
    KEGCMsgInviteUserToLobby = 523
    KEGCMsgGetGamePersonalDataCategoriesRequest = 524
    KEGCMsgGetGamePersonalDataCategoriesResponse = 525
    KEGCMsgGetGamePersonalDataEntriesRequest = 526
    KEGCMsgGetGamePersonalDataEntriesResponse = 527
    KEGCMsgTerminateGamePersonalDataEntriesRequest = 528
    KEGCMsgTerminateGamePersonalDataEntriesResponse = 529
    KEGCMsgRecurringSubscriptionStatusChange = 530
    KEGCMsgDirectServiceMethod = 531
    KEGCMsgDirectServiceMethodResponse = 532
  end
  enum ESOMsg
    KESOMsgCreate = 21
    KESOMsgUpdate = 22
    KESOMsgDestroy = 23
    KESOMsgCacheSubscribed = 24
    KESOMsgCacheUnsubscribed = 25
    KESOMsgUpdateMultiple = 26
    KESOMsgCacheSubscriptionCheck = 27
    KESOMsgCacheSubscriptionRefresh = 28
  end
  enum EGCBaseClientMsg
    KEMsgGCClientWelcome = 4004
    KEMsgGCServerWelcome = 4005
    KEMsgGCClientHello = 4006
    KEMsgGCServerHello = 4007
    KEMsgGCClientConnectionStatus = 4009
    KEMsgGCServerConnectionStatus = 4010
    KEMsgGCClientHelloPartner = 4011
    KEMsgGCClientHelloPW = 4012
    KEMsgGCClientHelloR2 = 4013
    KEMsgGCClientHelloR3 = 4014
    KEMsgGCClientHelloR4 = 4015
  end
  enum EGCToGCMsg
    KEGCToGCMsgMasterAck = 150
    KEGCToGCMsgMasterAckResponse = 151
    KEGCToGCMsgRouted = 152
    KEGCToGCMsgRoutedReply = 153
    KEMsgUpdateSessionIP = 154
    KEMsgRequestSessionIP = 155
    KEMsgRequestSessionIPResponse = 156
    KEGCToGCMsgMasterStartupComplete = 157
  end
  enum ECommunityItemClass
    KECommunityItemClassInvalid = 0
    KECommunityItemClassBadge = 1
    KECommunityItemClassGameCard = 2
    KECommunityItemClassProfileBackground = 3
    KECommunityItemClassEmoticon = 4
    KECommunityItemClassBoosterPack = 5
    KECommunityItemClassConsumable = 6
    KECommunityItemClassGameGoo = 7
    KECommunityItemClassProfileModifier = 8
    KECommunityItemClassScene = 9
    KECommunityItemClassSalienItem = 10
  end
  enum ECommunityItemAttribute
    KECommunityItemAttributeInvalid = 0
    KECommunityItemAttributeCardBorder = 1
    KECommunityItemAttributeLevel = 2
    KECommunityItemAttributeIssueNumber = 3
    KECommunityItemAttributeTradableTime = 4
    KECommunityItemAttributeStorePackageID = 5
    KECommunityItemAttributeCommunityItemAppID = 6
    KECommunityItemAttributeCommunityItemType = 7
    KECommunityItemAttributeProfileModiferEnabled = 8
    KECommunityItemAttributeExpiryTime = 9
  end
  
  struct CMsgGCHVacVerificationChange
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :appid, :uint32, 2
      optional :is_verified, :bool, 3
    end
  end
  
  struct CMsgGCHAccountPhoneNumberChange
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :appid, :uint32, 2
      optional :phone_id, :uint64, 3
      optional :is_verified, :bool, 4
      optional :is_identifying, :bool, 5
    end
  end
  
  struct CMsgGCHInviteUserToLobby
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :appid, :uint32, 2
      optional :steamid_invited, :fixed64, 3
      optional :steamid_lobby, :fixed64, 4
    end
  end
  
  struct CMsgGCHRecurringSubscriptionStatusChange
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :steamid, :fixed64, 1
      optional :appid, :uint32, 2
      optional :agreementid, :fixed64, 3
      optional :active, :bool, 4
    end
  end
  
  struct CQuest_PublisherAddCommunityItemsToPlayer_Request
    include Protobuf::Message
    
    struct Attribute
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :attribute, :uint32, 1
        optional :value, :uint64, 2
      end
    end
    
    contract_of "proto2" do
      optional :steamid, :uint64, 1
      optional :appid, :uint32, 2
      optional :match_item_type, :uint32, 3
      optional :match_item_class, :uint32, 4
      optional :prefix_item_name, :string, 5
      repeated :attributes, CQuest_PublisherAddCommunityItemsToPlayer_Request::Attribute, 6
      optional :note, :string, 7
    end
  end
  
  struct CQuest_PublisherAddCommunityItemsToPlayer_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :items_matched, :uint32, 1
      optional :items_granted, :uint32, 2
    end
  end
  
  struct CCommunity_GamePersonalDataCategoryInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :type, :string, 1
      optional :localization_token, :string, 2
      optional :template_file, :string, 3
    end
  end
  
  struct CCommunity_GetGamePersonalDataCategories_Request
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :appid, :uint32, 1
    end
  end
  
  struct CCommunity_GetGamePersonalDataCategories_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :categories, CCommunity_GamePersonalDataCategoryInfo, 1
      optional :app_assets_basename, :string, 2
    end
  end
  
  struct CCommunity_GetGamePersonalDataEntries_Request
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :appid, :uint32, 1
      optional :steamid, :uint64, 2
      optional :type, :string, 3
      optional :continue_token, :string, 4
    end
  end
  
  struct CCommunity_GetGamePersonalDataEntries_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :gceresult, :uint32, 1
      repeated :entries, :string, 2
      optional :continue_token, :string, 3
      optional :continue_text, :string, 4
    end
  end
  
  struct CCommunity_TerminateGamePersonalDataEntries_Request
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :appid, :uint32, 1
      optional :steamid, :uint64, 2
    end
  end
  
  struct CCommunity_TerminateGamePersonalDataEntries_Response
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :gceresult, :uint32, 1
    end
  end
  end
