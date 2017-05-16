module FacebookAds
  # Ad ad creative has many ad images and belongs to an ad account.
  # https://developers.facebook.com/docs/marketing-api/reference/ad-creative
  class AdCreative < Base
    FIELDS               = %w[id name object_story_id object_story_spec object_type thumbnail_url].freeze
    CALL_TO_ACTION_TYPES = %w[SHOP_NOW INSTALL_MOBILE_APP USE_MOBILE_APP SIGN_UP DOWNLOAD BUY_NOW].freeze

    class << self
      def photo(name: nil, page_id: nil, instagram_actor_id: nil, message: nil, link: nil, link_title: nil, image_hash: nil, call_to_action_type: nil)
        object_story_spec = {
          'page_id' => page_id, # 300664329976860
          'instagram_actor_id' => instagram_actor_id, # 503391023081924
          'link_data' => {
            'link' => link, # https://tophatter.com/, https://itunes.apple.com/app/id619460348, http://play.google.com/store/apps/details?id=com.tophatter
            'message' => message,
            'image_hash' => image_hash,
            'call_to_action' => {
              'type' => call_to_action_type,
              'value' => {
                # 'application' =>,
                'link' => link,
                'link_title' => link_title
              }
            }
          }
        }

        {
          name: name,
          object_story_spec: object_story_spec.to_json
        }
      end

      # https://developers.facebook.com/docs/marketing-api/guides/videoads
      def carousel(name: nil, page_id: nil, instagram_actor_id: nil, link: nil, message: nil, assets: nil, call_to_action_type: nil, multi_share_optimized: nil, multi_share_end_card: nil)
        object_story_spec = {
          'page_id' => page_id, # 300664329976860
          'instagram_actor_id' => instagram_actor_id, # 503391023081924
          'link_data' => {
            'link' => link, # https://tophatter.com/, https://itunes.apple.com/app/id619460348, http://play.google.com/store/apps/details?id=com.tophatter
            'message' => message,
            'call_to_action' => { 'type' => call_to_action_type },
            'child_attachments' => assets.collect do |asset|
              {
                'link' => link,
                'image_hash' => asset[:hash],
                'name' => asset[:title],
                # 'description' => asset[:title],
                'call_to_action' => { 'type' => call_to_action_type } # Redundant?
              }
            end,
            'multi_share_optimized' => multi_share_optimized,
            'multi_share_end_card' => multi_share_end_card
          }
        }

        {
          name: name,
          object_story_spec: object_story_spec.to_json
        }
      end

      def product_set(name: nil, page_id: nil, link: nil, message: nil, headline: nil, description: nil, product_set_id: nil)
        {
          name: name,
          object_story_spec: {
            page_id: page_id,
            template_data: {
              description: description,
              link: link,
              message: message,
              name: headline
            }
          },
          template_url: link,
          product_set_id: product_set_id
        }
      end
    end
  end
end
