module CB
  module Client
    class Response
      attr_reader :body, :raw_body, :faraday_response

      def initialize(response, success, body=nil)
        @faraday_response = response
        @raw_body         = response.env[:raw_body]
        @success          = success
        @body             = body || response.body
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
