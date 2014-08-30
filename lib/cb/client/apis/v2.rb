require 'gyoku'

module CB
  module Client
    module APIs
      class V2 < APIBase

        def post(path, properties={})
          response = connection.post do |req|
            req.path = path
            req.body = xml_string(request(properties))
          end
          build_response(response)
        end

        module Endpoints
          USERS_CHANGE_PASSWORD = '/v2/User/ChangePW'
          USERS_DELETE          = '/v2/User/delete'
          USERS_GET             = '/v2/user/retrieve'
          USERS_CHECK_EXISTING  = '/v2/user/checkexisting'
          SAVED_SEARCHES_CREATE = '/v2/savedsearch/create'
          SPOT_GET              = '/v2/spot/load'
          RESUMES_CREATE        = '/v2/resume/create'
          RESUMES_PARSE         = '/v2/resume/parse'
        end

        private

        def request(properties={})
          {
            Request: {
              DeveloperKey: options[:developer_key],
              Test:         ENV['CB_TEST'] || false
            }.merge(properties)
          }
        end

        def build_response(response)
          success = response.status == 200
          body    = response.body

          if body.is_a?(Hash)
            # Step into root node
            body = body[body.keys.first]
            # Set success = false if errors are present
            success = success && !(body.has_key?('Errors') && body['Errors'] != nil)
          end

          Response.new(response, success, body)
        end

        def response_success?(response)
          response.status == 200
        end

        def xml_string(obj)
          Gyoku.xml(obj, {key_converter: :camelcase})
        end
      end
    end
  end
end
