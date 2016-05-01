require 'datapi/client/version'
require 'json'
require 'net/http'

module Datapi
  module Client
    #
    class StoreData
      def initialize(datapi_root_url, datapi_read_write_api_token)
        @datapi_root_url = datapi_root_url
        @datapi_read_write_api_token = datapi_read_write_api_token
      end

      def send(data, typeid, generated_at = nil)
        generated_at = DateTime.now if generated_at.nil?

        uri = URI.join(@datapi_root_url, '/data/', typeid)
        req = Net::HTTP::Post.new(
          uri.path,
          { 'Content-Type' => 'application/json',
            'Authorization' => "Token token=#{@datapi_read_write_api_token}"
          })
        req.body = { data: data, generated_at: generated_at }.to_json

        res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme.eql?('https')) do |http|
          http.request(req)
        end

        resp_data = JSON.parse(res.body)
        return resp_data
      end
    end
  end
end
