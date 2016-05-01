require 'spec_helper'

describe Datapi::Client do
  before :each do
    datapi_root_url = ENV['DATAPI_SERVER_URL']
    raise 'No DATAPI_SERVER_URL provided!' if datapi_root_url.to_s.empty?
    datapi_read_write_api_token = ENV['DATAPI_READ_WRITE_API_TOKEN']
    raise 'No DATAPI_READ_WRITE_API_TOKEN provided!' if datapi_read_write_api_token.to_s.empty?

    @datapi_store = Datapi::Client::StoreData.new(datapi_root_url, datapi_read_write_api_token)
  end

  it 'has a version number' do
    expect(Datapi::Client::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end

  it 'send data' do
    sample_data = { 'label' => 'sample_data', 'value' => true }
    resp_data = @datapi_store.send(sample_data, 'unit-test')
    expect(resp_data['item']['data']).to eq(sample_data)
  end
end
