require 'spec_helper'

describe CB::Client::Config do

  let(:config_module) { module MockConfig; extend CB::Client::Config end }

  CB::Client::Config::VALID_OPTIONS_KEYS.each do |config_key|
    describe "#{config_key}" do

      before do
        config_module.configure do |c|
          c.send("#{config_key}=", 'config_value')
        end
      end

      it 'is available as a property of the module' do
        expect(config_module.send(config_key)).to eq('config_value')
      end

      it 'is available in the .options hash' do
        expect(config_module.options[config_key]).to eq('config_value')
      end
    end
  end

  describe '#api_host' do
    context 'with environmental variable (CB_API_HOST) specified' do
      it 'should return the value of the environmental variable' do
        api_host = 'custom api host'
        ENV['CB_API_HOST'] = api_host
        expect(config_module.api_host).to eq(api_host)
      end

      it 'should override configuration' do
        api_host = 'custom api host'
        ENV['CB_API_HOST'] = api_host

        config_module.configure do |c|
          c.api_host = 'foo'
        end

        expect(config_module.api_host).to eq(api_host)
      end
    end
  end

  describe '#debug' do
    context 'with environmental variable (CB_DEBUG) specified' do
      it 'should return the value of the environmental variable' do
        cb_debug = 'true'
        ENV['CB_DEBUG'] = cb_debug
        expect(config_module.debug).to eq(cb_debug)
      end

       it 'should override configuration' do
        cb_debug = 'true'
        ENV['CB_DEBUG'] = cb_debug

        config_module.configure do |c|
          c.debug = false
        end

        expect(config_module.debug).to eq(cb_debug)
      end
    end
  end
end
