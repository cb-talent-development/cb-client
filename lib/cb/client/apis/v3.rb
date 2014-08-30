module CB
  module Client
    module APIs
      class V3 < APIBase

        def initialize(client)
          @client = client
        end

        module Endpoints
          JOBS_GET                = '/v3/Job'
          APPLICATIONS_REGISTERED = '/v3/application/registered'
        end
      end
    end
  end
end
