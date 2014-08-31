require 'spec_helper'

describe CB do
  describe '.new' do
    it 'returns a client instance' do
      expect(CB.new).to be_a(CB::Client::Client)
    end
  end
end
