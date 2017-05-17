module FacebookAds
  # An ad video belongs to an ad account.
  # https://developers.facebook.com/docs/marketing-api/advideo/v2.9
  class AdVideo < Base
    FIELDS = %w[id picture source embed_html embeddable format from icon content_category created_time description permalink_url updated_time].freeze

    class << self
      def find(_id)
        raise Exception, 'NOT IMPLEMENTED'
      end
    end

    def update(_data)
      raise Exception, 'NOT IMPLEMENTED'
    end

    def destroy
      raise Exception, 'NOT IMPLEMENTED'
    end
  end
end
