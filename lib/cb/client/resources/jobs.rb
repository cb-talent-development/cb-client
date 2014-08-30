module CB
  module Client
    module Resources
      class Jobs < ResourceBase
        def search(criteria)
          v1.get(APIs::V1::Endpoints::JOBS, criteria)
        end
      end
    end
  end
end
