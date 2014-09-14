require 'spec_helper'

describe CB::Client::Resources::Resumes do
  let(:resumes) { CB::Client::Resources::Resumes.new({}, {}) }

  describe '.parse' do

    let(:file_name) { 'jabberwocky.txt' }
    let(:file_contents) { 'Twas bryllyg, and ye slythy toves' }
    let(:file_contents_64) { Base64.encode64('Twas bryllyg, and ye slythy toves') }

    it 'determines file name' do
    end

    it 'encodes file contents as base64' do
      file = mock()
      file.stubs(:read).returns(file_contents)
      file.stubs(:close)

      File.stubs(:open).returns(file)
      File.stubs(:basename).returns(file_name)

      body = {FileName: file_name, FileBytes: file_contents_64}
      v2 = mock()
      v2.stubs(:post).with(CB::Client::APIs::V2::Endpoints::RESUMES_PARSE, body)
      resumes.stubs(:v2).returns(v2)
      resumes.parse(file_name)
    end
  end
end
