module Helpers

  def mock_connection
    Faraday.new do |conn|
      conn.response :xml, content_type: /\bxml$/
      conn.adapter :test do |stubs|
        yield stubs
      end
    end
  end

  def stub_v1(arguments={developer_key: '1234'})
    connection = mock()
    yield connection
    v1 = CB::Client::APIs::V1.new(arguments)
    v1.stubs(:connection).returns(connection)
    v1
  end

  def stub_v2(arguments={developer_key: '1234'})
    connection = mock()
    yield connection
    v2 = CB::Client::APIs::V2.new(arguments)
    v2.stubs(:connection).returns(connection)
    v2
  end

  def successful_v1_response
    response = mock()
    response.stubs(:status).returns(200)
    response.stubs(:body).returns({})
    response
  end

  def successful_v2_response
    response = mock()
    response.stubs(:status).returns(200)
    response.stubs(:body).returns({'RootNode' => {'Errors' => nil}})
    response
  end
end
