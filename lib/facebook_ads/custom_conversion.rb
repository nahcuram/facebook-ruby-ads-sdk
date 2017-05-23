module FacebookAds
  # document
  # https://developers.facebook.com/docs/marketing-api/reference/custom-conversion/
  class CustomConversion < Base
    FIELDS   = %w[id custom_event_type rule name].freeze
  end
end
