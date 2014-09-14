require 'gyoku'

module CB
  module Client
    module APIs
      class V2 < APIBase

        def post(path, body={})
          response = connection.post do |req|
            req.path                 = path
            req.options.preserve_raw = true

            if body.kind_of?(Hash)
              cleaned_properties = clean_request_hash!(body.clone)
              req.body = xml_string(request(cleaned_properties))
            else
              req.body = body
            end
          end
          build_response_from_xml(response)
        end

        module Endpoints
          USERS_CREATE          = '/v2/User/create'
          USERS_UPDATE          = '/v2/User/edit'
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
              Test:         options[:debug] ? 'true' : 'false'
            }.merge(properties)
          }
        end

        def response_success?(response)
          response.status == 200
        end

        def xml_string(obj)
          Gyoku.xml(obj, {key_converter: :camelcase})
        end

        def clean_request_value(value)
          if value.kind_of?(Hash)
            clean_request_hash!(value)
          elsif value.kind_of?(Array)
            value.compact.map { |v| clean_request_value(v) }
          elsif !!value == value # If boolean
            value ? 'true' : 'false'
          else
            value
          end
        end

        # Perform hash value manipulation to generate valid XML
        # (ex. gyoku converts nil to xsi:nil so we need to remove nil values)
        def clean_request_hash!(h)
          h.each do |k, v|
            if v.nil?
              h.delete(k)
            else
              h[k] = clean_request_value(v)
            end
          end
        end
      end
    end
  end
end
