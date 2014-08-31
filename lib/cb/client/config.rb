module CB
  module Client
    module Config

      VALID_OPTIONS_KEYS = [
        :developer_key,
        :client,
        :api_host,
        :debug
      ]

      attr_accessor *VALID_OPTIONS_KEYS

      def configure
        yield self
        self
      end

      def options
        options = {}
        VALID_OPTIONS_KEYS.each{ |name| options[name] = send(name) }
        options
      end

      def api_host
        ENV['CB_API_HOST'] || @api_host || 'https://api.careerbuilder.com'
      end

      def debug
        ENV['CB_DEBUG'] || @debug || false
      end
    end
  end
end
