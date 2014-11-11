require 'faraday'
require 'faraday_middleware'

module CB
  module Client
    module APIs
      class APIBase
        def initialize(options)
          @options = options
        end

        protected

        attr_accessor :options

        def connection(connection_options = {})
          conn_options = default_connection_options.merge(connection_options)
          Faraday.new(options[:api_host], conn_options) do |conn|
            conn.adapter faraday_client
            conn.response :xml, content_type: /\bxml$/
          end
        end

        def faraday_client
          options[:client] || Faraday.default_adapter
        end

        def default_connection_options
          {
            headers: {
              developerkey: options[:developer_key],
              user_agent: "cb-client (Ruby) - #{CB::VERSION}"
            },
            url: options[:api_host]
          }
        end

        # Build response from format shared by most v1 and v2 responses
        def build_response_from_xml(response)
          success = response.status == 200
          body    = response.body

          if body.is_a?(Hash)
            # Step into root node
            body = body[body.keys.first]
            # Set success = false if errors are present
            success = success && !(body.has_key?('Errors') && body['Errors'] != nil)
          end

          Response.new(response, success, body)
        end
      end
    end
  end
end
