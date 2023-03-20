## Generated from cstrike15_usermessages.proto
require "protobuf"

module Csgo
  enum ECstrike15UserMessages
    CSUMVGUIMenu = 1
    CSUMGeiger = 2
    CSUMTrain = 3
    CSUMHudText = 4
    CSUMSayText = 5
    CSUMSayText2 = 6
    CSUMTextMsg = 7
    CSUMHudMsg = 8
    CSUMResetHud = 9
    CSUMGameTitle = 10
    CSUMShake = 12
    CSUMFade = 13
    CSUMRumble = 14
    CSUMCloseCaption = 15
    CSUMCloseCaptionDirect = 16
    CSUMSendAudio = 17
    CSUMRawAudio = 18
    CSUMVoiceMask = 19
    CSUMRequestState = 20
    CSUMDamage = 21
    CSUMRadioText = 22
    CSUMHintText = 23
    CSUMKeyHintText = 24
    CSUMProcessSpottedEntityUpdate = 25
    CSUMReloadEffect = 26
    CSUMAdjustMoney = 27
    CSUMUpdateTeamMoney = 28
    CSUMStopSpectatorMode = 29
    CSUMKillCam = 30
    CSUMDesiredTimescale = 31
    CSUMCurrentTimescale = 32
    CSUMAchievementEvent = 33
    CSUMMatchEndConditions = 34
    CSUMDisconnectToLobby = 35
    CSUMPlayerStatsUpdate = 36
    CSUMDisplayInventory = 37
    CSUMWarmupHasEnded = 38
    CSUMClientInfo = 39
    CSUMXRankGet = 40
    CSUMXRankUpd = 41
    CSUMCallVoteFailed = 45
    CSUMVoteStart = 46
    CSUMVotePass = 47
    CSUMVoteFailed = 48
    CSUMVoteSetup = 49
    CSUMServerRankRevealAll = 50
    CSUMSendLastKillerDamageToClient = 51
    CSUMServerRankUpdate = 52
    CSUMItemPickup = 53
    CSUMShowMenu = 54
    CSUMBarTime = 55
    CSUMAmmoDenied = 56
    CSUMMarkAchievement = 57
    CSUMMatchStatsUpdate = 58
    CSUMItemDrop = 59
    CSUMGlowPropTurnOff = 60
    CSUMSendPlayerItemDrops = 61
    CSUMRoundBackupFilenames = 62
    CSUMSendPlayerItemFound = 63
    CSUMReportHit = 64
    CSUMXpUpdate = 65
    CSUMQuestProgress = 66
    CSUMScoreLeaderboardData = 67
    CSUMPlayerDecalDigitalSignature = 68
    CSUMWeaponSound = 69
    CSUMUpdateScreenHealthBar = 70
    CSUMEntityOutlineHighlight = 71
    CSUMSSUI = 72
    CSUMSurvivalStats = 73
    CSUMDisconnectToLobby2 = 74
    CSUMEndOfMatchAllPlayersData = 75
    CSUMRoundImpactScoreData = 79
    CSUMCurrentRoundOdds = 80
    CSUMDeepStats = 81
    CSUMUtilMsg = 82
    CSUMUtilMsgResponse = 83
  end
  enum ECSUsrMsg_DisconnectToLobby_Action
    KECSUsrMsgDisconnectToLobbyActionDefault = 0
    KECSUsrMsgDisconnectToLobbyActionGoQueue = 1
  end
  
  struct CCSUsrMsg_VGUIMenu
    include Protobuf::Message
    
    struct Subkey
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :name, :string, 1
        optional :str, :string, 2
      end
    end
    
    contract_of "proto2" do
      optional :name, :string, 1
      optional :show, :bool, 2
      repeated :subkeys, CCSUsrMsgVGUIMenu::Subkey, 3
    end
  end
  
  struct CCSUsrMsg_Geiger
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :range, :int32, 1
    end
  end
  
  struct CCSUsrMsg_Train
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :train, :int32, 1
    end
  end
  
  struct CCSUsrMsg_HudText
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :text, :string, 1
    end
  end
  
  struct CCSUsrMsg_SayText
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :ent_idx, :int32, 1
      optional :text, :string, 2
      optional :chat, :bool, 3
      optional :textallchat, :bool, 4
    end
  end
  
  struct CCSUsrMsg_SayText2
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :ent_idx, :int32, 1
      optional :chat, :bool, 2
      optional :msg_name, :string, 3
      repeated :params, :string, 4
      optional :textallchat, :bool, 5
    end
  end
  
  struct CCSUsrMsg_TextMsg
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :msg_dst, :int32, 1
      repeated :params, :string, 3
    end
  end
  
  struct CCSUsrMsg_HudMsg
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :channel, :int32, 1
      optional :pos, CMsgVector2D, 2
      optional :clr1, CMsgRGBA, 3
      optional :clr2, CMsgRGBA, 4
      optional :effect, :int32, 5
      optional :fade_in_time, :float, 6
      optional :fade_out_time, :float, 7
      optional :hold_time, :float, 9
      optional :fx_time, :float, 10
      optional :text, :string, 11
    end
  end
  
  struct CCSUsrMsg_Shake
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :command, :int32, 1
      optional :local_amplitude, :float, 2
      optional :frequency, :float, 3
      optional :duration, :float, 4
    end
  end
  
  struct CCSUsrMsg_Fade
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :duration, :int32, 1
      optional :hold_time, :int32, 2
      optional :flags, :int32, 3
      optional :clr, CMsgRGBA, 4
    end
  end
  
  struct CCSUsrMsg_Rumble
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :index, :int32, 1
      optional :data, :int32, 2
      optional :flags, :int32, 3
    end
  end
  
  struct CCSUsrMsg_CloseCaption
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :hash, :uint32, 1
      optional :duration, :int32, 2
      optional :from_player, :bool, 3
      optional :cctoken, :string, 4
    end
  end
  
  struct CCSUsrMsg_CloseCaptionDirect
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :hash, :uint32, 1
      optional :duration, :int32, 2
      optional :from_player, :bool, 3
    end
  end
  
  struct CCSUsrMsg_SendAudio
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :radio_sound, :string, 1
    end
  end
  
  struct CCSUsrMsg_RawAudio
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :pitch, :int32, 1
      optional :entidx, :int32, 2
      optional :duration, :float, 3
      optional :voice_filename, :string, 4
    end
  end
  
  struct CCSUsrMsg_VoiceMask
    include Protobuf::Message
    
    struct PlayerMask
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :game_rules_mask, :int32, 1
        optional :ban_masks, :int32, 2
      end
    end
    
    contract_of "proto2" do
      repeated :player_masks, CCSUsrMsgVoiceMask::PlayerMask, 1
      optional :player_mod_enable, :bool, 2
    end
  end
  
  struct CCSUsrMsg_Damage
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :amount, :int32, 1
      optional :inflictor_world_pos, CMsgVector, 2
      optional :victim_entindex, :int32, 3
    end
  end
  
  struct CCSUsrMsg_RadioText
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :msg_dst, :int32, 1
      optional :client, :int32, 2
      optional :msg_name, :string, 3
      repeated :params, :string, 4
    end
  end
  
  struct CCSUsrMsg_HintText
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :text, :string, 1
    end
  end
  
  struct CCSUsrMsg_KeyHintText
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :hints, :string, 1
    end
  end
  
  struct CCSUsrMsg_ProcessSpottedEntityUpdate
    include Protobuf::Message
    
    struct SpottedEntityUpdate
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :entity_idx, :int32, 1
        optional :class_id, :int32, 2
        optional :origin_x, :int32, 3
        optional :origin_y, :int32, 4
        optional :origin_z, :int32, 5
        optional :angle_y, :int32, 6
        optional :defuser, :bool, 7
        optional :player_has_defuser, :bool, 8
        optional :player_has_c4, :bool, 9
      end
    end
    
    contract_of "proto2" do
      optional :new_update, :bool, 1
      repeated :entity_updates, CCSUsrMsgProcessSpottedEntityUpdate::SpottedEntityUpdate, 2
    end
  end
  
  struct CCSUsrMsg_SendPlayerItemDrops
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :entity_updates, CEconItemPreviewDataBlock, 1
    end
  end
  
  struct CCSUsrMsg_SendPlayerItemFound
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :iteminfo, CEconItemPreviewDataBlock, 1
      optional :entindex, :int32, 2
    end
  end
  
  struct CCSUsrMsg_ReloadEffect
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :entidx, :int32, 1
      optional :actanim, :int32, 2
      optional :origin_x, :float, 3
      optional :origin_y, :float, 4
      optional :origin_z, :float, 5
    end
  end
  
  struct CCSUsrMsg_WeaponSound
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :entidx, :int32, 1
      optional :origin_x, :float, 2
      optional :origin_y, :float, 3
      optional :origin_z, :float, 4
      optional :sound, :string, 5
      optional :timestamp, :float, 6
    end
  end
  
  struct CCSUsrMsg_UpdateScreenHealthBar
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :entidx, :int32, 1
      optional :healthratio_old, :float, 2
      optional :healthratio_new, :float, 3
      optional :style, :int32, 4
    end
  end
  
  struct CCSUsrMsg_EntityOutlineHighlight
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :entidx, :int32, 1
      optional :removehighlight, :bool, 2
    end
  end
  
  struct CCSUsrMsg_AdjustMoney
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :amount, :int32, 1
    end
  end
  
  struct CCSUsrMsg_ReportHit
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :pos_x, :float, 1
      optional :pos_y, :float, 2
      optional :timestamp, :float, 4
      optional :pos_z, :float, 3
    end
  end
  
  struct CCSUsrMsg_KillCam
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :obs_mode, :int32, 1
      optional :first_target, :int32, 2
      optional :second_target, :int32, 3
    end
  end
  
  struct CCSUsrMsg_DesiredTimescale
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :desired_timescale, :float, 1
      optional :duration_realtime_sec, :float, 2
      optional :interpolator_type, :int32, 3
      optional :start_blend_time, :float, 4
    end
  end
  
  struct CCSUsrMsg_CurrentTimescale
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :cur_timescale, :float, 1
    end
  end
  
  struct CCSUsrMsg_AchievementEvent
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :achievement, :int32, 1
      optional :count, :int32, 2
      optional :user_id, :int32, 3
    end
  end
  
  struct CCSUsrMsg_MatchEndConditions
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :fraglimit, :int32, 1
      optional :mp_maxrounds, :int32, 2
      optional :mp_winlimit, :int32, 3
      optional :mp_timelimit, :int32, 4
    end
  end
  
  struct CCSUsrMsg_PlayerStatsUpdate
    include Protobuf::Message
    
    struct Stat
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :idx, :int32, 1
        optional :delta, :int32, 2
      end
    end
    
    contract_of "proto2" do
      optional :version, :int32, 1
      repeated :stats, CCSUsrMsgPlayerStatsUpdate::Stat, 4
      optional :user_id, :int32, 5
      optional :crc, :int32, 6
    end
  end
  
  struct CCSUsrMsg_DisplayInventory
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :display, :bool, 1
      optional :user_id, :int32, 2
    end
  end
  
  struct CCSUsrMsg_QuestProgress
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :quest_id, :uint32, 1
      optional :normal_points, :uint32, 2
      optional :bonus_points, :uint32, 3
      optional :is_event_quest, :bool, 4
    end
  end
  
  struct CCSUsrMsg_ScoreLeaderboardData
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :data, ScoreLeaderboardData, 1
    end
  end
  
  struct CCSUsrMsg_PlayerDecalDigitalSignature
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :data, PlayerDecalDigitalSignature, 1
    end
  end
  
  struct CCSUsrMsg_XRankGet
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :mode_idx, :int32, 1
      optional :controller, :int32, 2
    end
  end
  
  struct CCSUsrMsg_XRankUpd
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :mode_idx, :int32, 1
      optional :controller, :int32, 2
      optional :ranking, :int32, 3
    end
  end
  
  struct CCSUsrMsg_CallVoteFailed
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :reason, :int32, 1
      optional :time, :int32, 2
    end
  end
  
  struct CCSUsrMsg_VoteStart
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :team, :int32, 1
      optional :ent_idx, :int32, 2
      optional :vote_type, :int32, 3
      optional :disp_str, :string, 4
      optional :details_str, :string, 5
      optional :other_team_str, :string, 6
      optional :is_yes_no_vote, :bool, 7
      optional :entidx_target, :int32, 8
    end
  end
  
  struct CCSUsrMsg_VotePass
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :team, :int32, 1
      optional :vote_type, :int32, 2
      optional :disp_str, :string, 3
      optional :details_str, :string, 4
    end
  end
  
  struct CCSUsrMsg_VoteFailed
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :team, :int32, 1
      optional :reason, :int32, 2
    end
  end
  
  struct CCSUsrMsg_VoteSetup
    include Protobuf::Message
    
    contract_of "proto2" do
      repeated :potential_issues, :string, 1
    end
  end
  
  struct CCSUsrMsg_SendLastKillerDamageToClient
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :num_hits_given, :int32, 1
      optional :damage_given, :int32, 2
      optional :num_hits_taken, :int32, 3
      optional :damage_taken, :int32, 4
    end
  end
  
  struct CCSUsrMsg_ServerRankUpdate
    include Protobuf::Message
    
    struct RankUpdate
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :account_id, :int32, 1
        optional :rank_old, :int32, 2
        optional :rank_new, :int32, 3
        optional :num_wins, :int32, 4
        optional :rank_change, :float, 5
        optional :rank_type_id, :int32, 6
      end
    end
    
    contract_of "proto2" do
      repeated :rank_update, CCSUsrMsgServerRankUpdate::RankUpdate, 1
    end
  end
  
  struct CCSUsrMsg_XpUpdate
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :data, CMsgGCCstrike15V2GC2ServerNotifyXPRewarded, 1
    end
  end
  
  struct CCSUsrMsg_ItemPickup
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :item, :string, 1
    end
  end
  
  struct CCSUsrMsg_ShowMenu
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :bits_valid_slots, :int32, 1
      optional :display_time, :int32, 2
      optional :menu_string, :string, 3
    end
  end
  
  struct CCSUsrMsg_BarTime
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :time, :string, 1
    end
  end
  
  struct CCSUsrMsg_AmmoDenied
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :ammo_idx, :int32, 1
    end
  end
  
  struct CCSUsrMsg_MarkAchievement
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :achievement, :string, 1
    end
  end
  
  struct CCSUsrMsg_MatchStatsUpdate
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :update, :string, 1
    end
  end
  
  struct CCSUsrMsg_ItemDrop
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :itemid, :int64, 1
      optional :death, :bool, 2
    end
  end
  
  struct CCSUsrMsg_GlowPropTurnOff
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :entidx, :int32, 1
    end
  end
  
  struct CCSUsrMsg_RoundBackupFilenames
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :count, :int32, 1
      optional :index, :int32, 2
      optional :filename, :string, 3
      optional :nicename, :string, 4
    end
  end
  
  struct CCSUsrMsg_SSUI
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :show, :bool, 1
      optional :start_time, :float, 2
      optional :end_time, :float, 3
    end
  end
  
  struct CCSUsrMsg_SurvivalStats
    include Protobuf::Message
    
    struct Fact
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :type, :int32, 1
        optional :display, :int32, 2
        optional :value, :int32, 3
        optional :interestingness, :float, 4
      end
    end
    
    struct Placement
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :xuid, :uint64, 1
        optional :teamnumber, :int32, 2
        optional :placement, :int32, 3
      end
    end
    
    struct Damage
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :xuid, :uint64, 1
        optional :to, :int32, 2
        optional :to_hits, :int32, 3
        optional :from, :int32, 4
        optional :from_hits, :int32, 5
      end
    end
    
    contract_of "proto2" do
      optional :xuid, :uint64, 1
      repeated :facts, CCSUsrMsgSurvivalStats::Fact, 2
      repeated :users, CCSUsrMsgSurvivalStats::Placement, 3
      repeated :damages, CCSUsrMsgSurvivalStats::Damage, 5
      optional :ticknumber, :int32, 4
    end
  end
  
  struct CCSUsrMsg_EndOfMatchAllPlayersData
    include Protobuf::Message
    
    struct Accolade
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :eaccolade, :int32, 1
        optional :value, :float, 2
        optional :position, :int32, 3
      end
    end
    
    struct PlayerData
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :entindex, :int32, 1
        optional :xuid, :uint64, 2
        optional :name, :string, 3
        optional :teamnumber, :int32, 4
        optional :nomination, CCSUsrMsgEndOfMatchAllPlayersData::Accolade, 5
        repeated :items, CEconItemPreviewDataBlock, 6
        optional :playercolor, :int32, 7
        optional :isbot, :bool, 8
      end
    end
    
    contract_of "proto2" do
      repeated :allplayerdata, CCSUsrMsgEndOfMatchAllPlayersData::PlayerData, 1
      optional :scene, :int32, 2
    end
  end
  
  struct CCSUsrMsg_RoundImpactScoreData
    include Protobuf::Message
    
    struct RisEvent
      include Protobuf::Message
      
      struct Victim
        include Protobuf::Message
        
        contract_of "proto2" do
          optional :team_number, :int32, 1
          optional :entindex, :int32, 2
          optional :xuid, :uint64, 3
          optional :color, :int32, 4
          optional :is_bot, :bool, 5
          optional :is_dead, :bool, 6
        end
      end
      
      struct Objective
        include Protobuf::Message
        
        contract_of "proto2" do
          optional :type, :int32, 1
        end
      end
      
      struct Damage
        include Protobuf::Message
        
        contract_of "proto2" do
          optional :target_entindex, :int32, 1
          optional :target_xuid, :uint64, 2
          optional :health_removed, :int32, 3
          optional :num_hits, :int32, 4
          optional :return_health_removed, :int32, 5
          optional :num_return_hits, :int32, 6
        end
      end
      
      contract_of "proto2" do
        optional :timestamp, :float, 1
        optional :terrorist_odds, :int32, 2
        optional :ct_alive, :int32, 3
        optional :t_alive, :int32, 4
        optional :victim_data, CCSUsrMsgRoundImpactScoreData::RisEvent::Victim, 5
        optional :objective_data, CCSUsrMsgRoundImpactScoreData::RisEvent::Objective, 6
        repeated :all_damage_data, CCSUsrMsgRoundImpactScoreData::RisEvent::Damage, 7
      end
    end
    
    struct InitialConditions
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :ct_equip_value, :int32, 1
        optional :t_equip_value, :int32, 2
        optional :terrorist_odds, :int32, 3
      end
    end
    
    contract_of "proto2" do
      optional :init_conditions, CCSUsrMsgRoundImpactScoreData::InitialConditions, 1
      repeated :all_ris_event_data, CCSUsrMsgRoundImpactScoreData::RisEvent, 2
    end
  end
  
  struct CCSUsrMsg_CurrentRoundOdds
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :odds, :int32, 1
    end
  end
  
  struct CCSUsrMsg_DeepStats
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :stats, CMsgGCCStrike15ClientDeepStats, 1
    end
  end
  
  struct CCSUsrMsg_ResetHud
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :reset, :bool, 1
    end
  end
  
  struct CCSUsrMsg_GameTitle
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :dummy, :int32, 1
    end
  end
  
  struct CCSUsrMsg_RequestState
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :dummy, :int32, 1
    end
  end
  
  struct CCSUsrMsg_StopSpectatorMode
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :dummy, :int32, 1
    end
  end
  
  struct CCSUsrMsg_DisconnectToLobby
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :dummy, :int32, 1
    end
  end
  
  struct CCSUsrMsg_WarmupHasEnded
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :dummy, :int32, 1
    end
  end
  
  struct CCSUsrMsg_ClientInfo
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :dummy, :int32, 1
    end
  end
  
  struct CCSUsrMsg_ServerRankRevealAll
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :seconds_till_shutdown, :int32, 1
      optional :reservation, CMsgGCCStrike15V2MatchmakingGC2ServerReserve, 2
    end
  end
  
  struct CCSUsrMsg_UtilMsg
    include Protobuf::Message
    
    contract_of "proto2" do
      optional :util_action, :string, 1
      optional :util1, :int32, 2
      optional :util2, :int32, 3
      optional :util3, :int32, 4
      optional :util4, :int32, 5
      optional :util5, :int32, 6
    end
  end
  
  struct CCSUsrMsg_UtilMsg_Response
    include Protobuf::Message
    
    struct ItemDetail
      include Protobuf::Message
      
      contract_of "proto2" do
        optional :index, :int32, 1
        optional :hash, :int32, 2
        optional :crc, :int32, 3
        optional :name, :string, 4
      end
    end
    
    contract_of "proto2" do
      optional :crc, :fixed32, 1
      optional :item_count, :int32, 2
      optional :crc2, :fixed32, 3
      optional :item_count2, :int32, 4
      repeated :crc_part, :int32, 5
      repeated :crc_part2, :int32, 6
      optional :client_timestamp, :int32, 7
      optional :platform, :int32, 8
      repeated :itemdetails, CCSUsrMsgUtilMsgResponse::ItemDetail, 9
      optional :itemgroup, :int32, 10
    end
  end
  end
