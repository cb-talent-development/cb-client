require 'base64'
require 'builder'
require 'active_support/inflector'

module CB
  module Client
    module Resources
      class Resumes < ResourceBase
        def create(criteria)
          v2.post(APIs::V2::Endpoints::RESUMES_CREATE, Mappers::Resume::build_create_request(criteria))
        end

        def parse(path)
          parse_from_path(path)
        end

        def parse_from_path(path)
          file  = File.open(path, 'rb')
          name  = File.basename(path)
          bytes = file.read
          file.close
          parse_from_bytes(bytes, name)
        end

        def parse_from_bytes(bytes, file_name)
          v2.post(APIs::V2::Endpoints::RESUMES_PARSE, FileName: file_name, FileBytes: Base64.encode64(bytes))
        end
      end
    end
  end
end
