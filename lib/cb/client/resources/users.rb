module CB
  module Client
    module Resources
      class Users < ResourceBase
        def check_existing(email, password)
          v2.post(APIs::V2::Endpoints::USERS_CHECK_EXISTING,
            {
              Email:    email, 
              Password: password
            }
          )
        end

        def create(params)
          v2.post(APIs::V2::Endpoints::USERS_CREATE, params)
        end

        def update(params)
          v2.post(APIs::V2::Endpoints::USERS_UPDATE, params)
        end

        def temporary_password(external_id)
          v1.get(APIs::V1::Endpoints::USERS_TEMPORARY_PASSWORD, 
            {
              ExternalID: external_id
            }
          )
        end

        def retrieve(external_id)
          v2.post(APIs::V2::Endpoints::USERS_GET, 
            {
              ExternalID: external_id
            }
          )
        end

        def change_password(external_id, old_password, new_password)
          v2.post(APIs::V2::Endpoints::USERS_CHANGE_PASSWORD, 
            {
              ExternalID:  external_id, 
              OldPassword: old_password, 
              NewPassword: new_password
            }
          )
        end

        def delete(external_id)
          v2.post(APIs::V2::Endpoints::USERS_DELETE, 
            {
              ExternalID: external_id
            }
          )
        end
      end
    end
  end
end
