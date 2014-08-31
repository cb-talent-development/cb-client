require 'spec_helper'

describe CB::Client::Client do

  describe '.new' do
    it 'uses configuration defaults from CB.configure' do
      options = { developer_key: '1234' }
      CB.stubs(:options).returns(options)

      CB::Client::APIs::V1.expects(:new).with(options)
      CB::Client::APIs::V2.expects(:new).with(options)
      CB::Client::APIs::V3.expects(:new).with(options)

      client = CB::Client::Client.new
    end

    it 'overrides default configuration' do
      options  = { developer_key: '1234', api_host: 'foo' }
      override = { developer_key: '4567' }
      combined = options.merge(override)      
      CB.stubs(:options).returns(options)

      CB::Client::APIs::V1.expects(:new).with(combined)
      CB::Client::APIs::V2.expects(:new).with(combined)
      CB::Client::APIs::V3.expects(:new).with(combined)

      client = CB::Client::Client.new(override)
    end
  end
end
