# # Generated from encrypted_app_ticket.proto
require "protobuf"

module Steam
  struct EncryptedAppTicket
    include Protobuf::Message

    contract_of "proto2" do
      optional :ticket_version_no, :uint32, 1
      optional :crc_encryptedticket, :uint32, 2
      optional :cb_encrypteduserdata, :uint32, 3
      optional :cb_encrypted_appownershipticket, :uint32, 4
      optional :encrypted_ticket, :bytes, 5
    end
  end
end
