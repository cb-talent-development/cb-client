module CB
  module Client
    module Endpoints
      # Here lies the API graveyard
      module EmployersEndpoints
        GET                             = '/Employer/CompanyDetails'
        RECOMMENDATIONS                 = '/Employer/JobRecommendation'
      end

      module ConsumersEndpoints
        RECOMMENDATIONS                 = '/consumer/jobsearch/recommendations/:resume_hash'
      end

      module TNEndpoints
        JOIN_FORM_GEO                   = '/tn/JoinForm/Geo'
      end

      module TalentNetworkEndpoints
        JOIN_FORM_BRANDING              = '/talentnetwork/config/layout/branding'
        MEMBERS_CREATE                  = '/talentnetwork/member/create'
      end

      module CBAPIEndpoints
        APPLICATIONS_GET                = '/cbapi/application/:did'
        APPLICATIONS_CREATE             = '/cbapi/application'
        SAVED_SEARCHES                  = '/cbapi/SavedSearches'
        SAVED_SEARCHES_CREATE           = '/cbapi/savedsearches'
        SAVED_SEARCHES_DELETE           = '/cbapi/savedsearches/:did'
      end
    end
  end
end
