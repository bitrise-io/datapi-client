require 'spec_helper'

describe Datapi::Client do
  it 'has a version number' do
    expect(Datapi::Client::VERSION).not_to be nil
  end

  it 'required test Env Vars are set' do
    datapi_root_url = ENV['DATAPI_SERVER_URL']
    raise 'No DATAPI_SERVER_URL provided!' if datapi_root_url.to_s.empty?
    datapi_read_write_api_token = ENV['DATAPI_READ_WRITE_API_TOKEN']
    raise 'No DATAPI_READ_WRITE_API_TOKEN provided!' if datapi_read_write_api_token.to_s.empty?
    datapi_readonly_api_token = ENV['DATAPI_READONLY_API_TOKEN']
    raise 'No DATAPI_READONLY_API_TOKEN provided!' if datapi_readonly_api_token.to_s.empty?
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end
end

describe Datapi::Client::StoreData do
  before :each do
    datapi_root_url = ENV['DATAPI_SERVER_URL']
    datapi_read_write_api_token = ENV['DATAPI_READ_WRITE_API_TOKEN']

    @datapi_store = Datapi::Client::StoreData.new(datapi_root_url, datapi_read_write_api_token)
  end

  it 'send data' do
    sample_data = { 'label' => 'sample_data', 'value' => true }
    resp_data = @datapi_store.send(sample_data, 'unit-test')
    expect(resp_data['item']['data']).to eq(sample_data)
  end
end

describe Datapi::Client::GetData do
  before :each do
    datapi_root_url = ENV['DATAPI_SERVER_URL']
    datapi_readonly_api_token = ENV['DATAPI_READONLY_API_TOKEN']

    @datapi_get = Datapi::Client::GetData.new(datapi_root_url, datapi_readonly_api_token)
  end

  it 'get items' do
    resp_data = @datapi_get.get_data_by_typeid('unit-test')
    resp_items = resp_data['items']

    expect(resp_items).not_to be_nil
    expect(resp_items).to be_an_instance_of(Array)
    expect(resp_items.length).to be >= 1
  end
end
