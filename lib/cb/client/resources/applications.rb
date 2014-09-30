module CB
  module Client
    module Resources
      class Applications < ResourceBase
        def registered(params)
          v3.post(APIs::V3::Endpoints::APPLICATIONS_REGISTERED, params)
        end
      end
    end
  end
end
