module Steamcr::SteamLanguage::Lexer::Matcher
  def matches?(stream : Tokenizer::Stream) : Token?
    if stream.eof?
      Token.new(TokenType::EOF)
    else
      stream.snapshot

      if match = match?(stream)
        stream.commit
        match
      else
        stream.rollback
        nil
      end
    end
  end

  private abstract def match?(stream : Tokenizer::Stream) : Token?
end
