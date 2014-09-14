module CB
  module Client
    module Resources
      class ResourceBase
        def initialize(apis, options)
          @options = options
          apis.each{ |name, value| send("#{name}=", value)  }
        end

        protected
        attr_accessor :v1, :v2, :v3
      end
    end
  end
end
