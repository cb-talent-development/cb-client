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
  end
end
