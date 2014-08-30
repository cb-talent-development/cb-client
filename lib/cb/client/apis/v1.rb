module CB
  module Client
    module APIs
      class V1 < APIBase

        def initialize(options)
          @options = options
        end

        def get(path, query)
          connection.get(path, query.merge(query_params))
        end

        module Endpoints
          CATEGORIES                      = '/v1/categories'
          INDUSTRIES                      = '/v1/industrycodes'
          EMPLOYEE_TYPES                  = '/v1/employeetypes'
          JOBS                            = '/v1/JobSearch'
          EDUCATION_CODES                 = '/v1/EducationCodes'
          RECOMMENDATIONS_BY_JOB          = '/v1/Recommendations/ForJob'
          RECOMMENDATIONS_BY_USER         = '/v1/Recommendations/ForUser'
          APPLICATIONS_SUBMIT             = '/v1/Application/submit'
          APPLICATIONS_EXTERNAL           = '/v1/application/external'
          USERS_TEMPORARY_PASSWORD        = '/v1/user/temporarypassword'
          ANONYMOUS_SAVED_SEARCHES_CREATE = '/v1/anonymoussavedjobsearch/create'
          ANONYMOUS_SAVED_SEARCHES_DELETE = '/v1/anonymoussavedjobsearch/delete'
          USERS_SUBSCRIPTIONS             = '/v1/user/subscription/retrieve?version=2'
          USERS_SUBSCRIPTIONS_UPDATE      = '/v1/user/subscription?version=2'
          RESUMES_WORK_STATUSES           = '/v1/resume/workstatuslist'
        end

        private

        def query_params
          {
            DeveloperKey: options[:developer_key]
          }
        end
      end
    end
  end
end
