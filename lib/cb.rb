require 'cb/client'
require 'cb/client/config'
require 'cb/client/version'

module CB

  VERSION = CB::Client::VERSION

  extend Client::Config

  class << self
    def new(client_options={})
      CB::Client.new(client_options)
    end

    def api_host
      ENV['CB_API_HOST'] || @api_host || 'https://api.careerbuilder.com'
    end
  end
end
