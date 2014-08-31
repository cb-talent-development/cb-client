require 'spec_helper'
require 'multi_xml'

describe CB::Client::APIs::V2 do

  let(:developer_key) { '1234' }

  describe '.post' do

    describe 'builds a valid XML request' do      
      # How do we test XML expectations?
      it 'includes <Request> root node'

      it 'includes <DeveloperKey>'

      it 'includes <Test>'

      it 'merges properties'
    end

    it 'is idempotent' do
      v2 = stub_v2 do |connection|
        connection.expects(:post).returns(successful_v2_response)
      end

      data = {integer: 123, hash: {string: 'foo'}}
      v2.post('/foo', data)
      expect(data).to eq(data)
    end

    it 'returns a CB::Client::Response' do
      v2 = stub_v2 do |connection|
        connection.expects(:post).returns(successful_v2_response)
      end

      response = v2.post('/foo')
      expect(response).to be_a(CB::Client::Response)
    end

    it 'returns success when response is successful' do
      v2 = stub_v2 do |connection|
        response = mock()
        response.stubs(:status).returns(500)
        response.stubs(:body).returns({'RootNode' => {'Errors' => nil}})
        connection.expects(:post).returns(response)
      end

      response = v2.post('/foo')
      expect(response.success?).to eq(false)
    end

    it 'sets success=false when response has errors' do
      v2 = stub_v2 do |connection|
        response = mock()
        response.stubs(:status).returns(200)
        response.stubs(:body).returns({'RootNode' => {'Errors' => [{}]}})
        connection.expects(:post).returns(response)
      end

      response = v2.post('/foo')
      expect(response.success?).to eq(false)
    end

    it 'sets success=false when HTTP status indicates error' do
    end
  end
end
