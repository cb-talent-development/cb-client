require 'spec_helper'

describe CB::Client::Resources::ResourceBase do

  apis = {v1: :v1, v2: :v2, v3: :v3}
  let(:resource_base) { CB::Client::Resources::ResourceBase.new(apis) }

  apis.keys.each do |key|
    describe "##{key}" do
      it 'is defined' do
        expect(resource_base.send(key)).to eq(apis[key])
      end
    end
  end
end
