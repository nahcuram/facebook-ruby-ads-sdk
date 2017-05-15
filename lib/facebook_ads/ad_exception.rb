module FacebookAds
  class AdException < StandardError
    attr_reader :code, :title, :message

    def initialize(code: nil, title: nil, message: nil)
      @code = code
      @title = title
      @message = message
    end
  end
end
