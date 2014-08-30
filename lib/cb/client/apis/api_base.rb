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

        def connection(connection_options={})
          conn_options = default_connection_options.merge(connection_options)
          Faraday.new(options[:api_host], conn_options) do |conn|
            conn.adapter faraday_client
            conn.response :xml, :content_type => /\bxml$/
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
      end
    end
  end
end
