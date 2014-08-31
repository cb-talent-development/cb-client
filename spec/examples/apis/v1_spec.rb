require 'spec_helper'

describe CB::Client::APIs::V1 do

  let(:developer_key) { '1234' }

  describe '.get' do
    it 'should add developer key to query parameters' do
      v1 = stub_v1 do |connection|
        connection.expects(:get)
                  .with('/foo', {DeveloperKey: developer_key})
                  .returns(successful_v1_response)
      end

      v1.get('/foo')
    end

    it 'should merge query parameters with developer key' do
      v1 = stub_v1 do |connection|
        connection.expects(:get)
                  .with('/foo', {DeveloperKey: developer_key, Custom: 'value'})
                  .returns(successful_v1_response)
      end

      v1.get('/foo', {Custom: 'value'})
    end

    it 'returns a CB::Client::Response' do
      v1 = stub_v1 do |connection|
        connection.expects(:get).returns(successful_v1_response)
      end

      response = v1.get('/foo')
      expect(response).to be_a(CB::Client::Response)
    end
  end
end
