require 'net/http'


module Adfly
  # Unofficial API Wrapper for adf.ly
  class API

    # Unique url API
    URL_API = 'http://api.adf.ly/api.php'

    # Create instance to use API adfly
    #
    # If you want to get API key from https://adf.ly/publisher/tools#tools-api
    #
    # @param uid [String] Uid
    # @param key [String] Key
    def initialize uid, key
      @uid, @key = uid, key
    end

    # Create single link
    #
    # Maybe you want to see https://adf.ly/publisher/tools#tools-api
    #
    # @param data [Hash] data to send api
    #
    # @option data [String] :url Link to be converted
    # @option data [Symbol] :advert_type Type of advertisement(:int or :banner)
    # @option data [String] :domain Alias domain to be used for ther generated link
    #
    # @example Simple use
    #   adfly.create_link(url: 'http://www.google.es')
    #
    # @return [String] Short link
    #
    # @raise [ArgumentError] Invalid parameters, link cannot be created
    def create_link data
      body = http_get URL_API, {key: @key, uid: @uid}.merge(data)
      
      raise ArgumentError if body.nil? || body.empty?
      body
    end

    private
    def http_get url, data
      uri = URI(url)
      uri.query = URI.encode_www_form(data)

      res = Net::HTTP.get_response(uri)
      res.body
    end
  end
end