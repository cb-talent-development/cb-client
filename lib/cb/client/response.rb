module CB
  module Client
    class Response
      attr_reader :body, :raw

      def initialize(raw_response, success, body=nil)
        @raw     = raw_response
        @success = success
        @body    = body || raw_response.body
      end

      def success?
        @success
      end

      def failure?
        !@success
      end
    end
  end
end
