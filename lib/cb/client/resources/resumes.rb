require 'base64'

module CB
  module Client
    module Resources
      class Resumes < ResourceBase
        def create(criteria)
          v2.post(APIs::V2::Endpoints::RESUMES_CREATE, criteria)
        end

        def parse(path)
          file  = File.open(path, 'rb')
          name  = File.basename(path)
          bytes = Base64.encode64(file.read)
          file.close
          v2.post(APIs::V2::Endpoints::RESUMES_PARSE, 
            {
              FileName:  name,
              FileBytes: bytes
            }
          )
        end
      end
    end
  end
end
