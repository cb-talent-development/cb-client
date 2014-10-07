module CB
  module Client
    module Resources
      class Applications < ResourceBase
        def registered(params)
          v2.post(APIs::V2::Endpoints::APPLICATIONS_REGISTERED, params)
        end
      end
    end
  end
end
