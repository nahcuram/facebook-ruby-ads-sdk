module FacebookAds
  # document
  # https://developers.facebook.com/docs/graph-api/reference/post
  class Post < Base
    FIELDS = %w[id message description updated_time permalink_url picture source name].freeze

    class << self
      def find_by_object_story_id(object_story_id)
        get("/#{object_story_id}", query: { fields: self::FIELDS.join(',') }, objectify: true)
      end
    end
  end
end
