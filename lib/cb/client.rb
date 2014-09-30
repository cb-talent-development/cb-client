require 'cb/client/apis/api_base'
require 'cb/client/apis/v1'
require 'cb/client/apis/v2'
require 'cb/client/apis/v3'
require 'cb/client/response'
require 'cb/client/resources/resource_base'
require 'cb/client/resources/jobs'
require 'cb/client/resources/users'
require 'cb/client/resources/resumes'
require 'cb/client/resources/applications'

module CB
  module Client
    class Client
      attr_reader :jobs, :resumes, :users, :applications

      def initialize(options={})
        options = CB.options.merge(options)

        @v1 = APIs::V1.new(options)
        @v2 = APIs::V2.new(options)
        @v3 = APIs::V3.new(options)

        @jobs    = Resources::Jobs.new(apis, options)
        @users   = Resources::Users.new(apis, options)
        @resumes = Resources::Resumes.new(apis, options)
        @applications = Resources::Applications.new(apis, options)
      end

      private

      def apis
        {v1: @v1, v2: @v2, v3: @v3}
      end
    end

    class << self
      def new(options={})
        Client.new(options)
      end
    end
  end
end
