require 'spec_helper'

describe CB::Client::Resources::Jobs do

  let(:jobs) { CB::Client::Resources::Jobs.new({}) }

  describe '.search' do
    it 'passes criteria to api' do
      criteria = {keywords: 'software engineer'}
      v1 = mock()
      v1.stubs(:get).with(CB::Client::APIs::V1::Endpoints::JOBS, criteria)
      jobs.stubs(:v1).returns(v1)
      jobs.search(criteria)
    end
  end
end
