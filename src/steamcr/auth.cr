module Steamcr
  class OnLogonEvent
    include Event
  end

  class Auth
    include PacketHandler

    def initialize(@client : Client)
    end

    def login(username, password, token = nil, hash = nil)
      msg = Protocol::MsgProtobuf(Steam::CMsgClientLogon).new(EMsg::CLIENT_LOGON)
      msg.body.two_factor_code = token if token
      msg.body.eresult_sentryfile = EResult::FILE_NOT_FOUND.value

      if hash
        msg.body.sha_sentryfile = hash
        msg.body.eresult_sentryfile = EResult::OK.value
      end

      msg.body.obfuscated_private_ip = Steam::CMsgIPAddress.new(v4: 3232238308u32 ^ Steamcr::MsgClientLogon::OBFUSCATION_MASK)
      msg.body.client_language = "english"
      msg.body.account_name = username
      msg.body.password = password
      msg.body.protocol_version = MsgClientLogon::CURRENT_PROTOCOL
      msg.body.client_os_type = EOSType::WIN311.value.to_u32
      msg.body.client_package_version = 1771u32

      @client.write(msg)
    end

    def handle_packet(message : Protocol::PacketMessage)
      case message.emsg
      when EMsg::CLIENT_LOG_ON_RESPONSE
        msg = Protocol::MsgProtobuf(Steam::CMsgClientLogonResponse).new(message)

        if msg.body.eresult != EResult::OK.value
          raise Exception.new("failed to login #{EResult.new(msg.body.eresult.not_nil!)}")
        else
          @client.steam_id = msg.header.proto.steamid.not_nil!
          @client.session_id = msg.header.proto.client_sessionid.not_nil!
          spawn @client.heartbeat(msg.body.out_of_game_heartbeat_seconds.not_nil!)
          @client.emit(OnLogonEvent.new)
        end
      when EMsg::CLIENT_UPDATE_MACHINE_AUTH
        msg = Protocol::MsgProtobuf(Steam::CMsgClientUpdateMachineAuth).new(message)
        sha = Digest::SHA1.digest(msg.body.bytes.not_nil!)

        file = SentryFile.new
        file.write(sha)

        resp = Protocol::MsgProtobuf(Steam::CMsgClientUpdateMachineAuthResponse).new(EMsg::CLIENT_UPDATE_MACHINE_AUTH_RESPONSE)
        resp.body.sha_file = sha
        resp.header.proto.jobid_target = msg.header.proto.jobid_source

        @client.write(resp)
      end
    end
  end
end
