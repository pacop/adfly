require 'rspec'
require 'webmock'
require 'webmock/rspec'

VALID_UID = '1234'
VALID_KEY = 'valid_key'
VALID_LINK = 'http://google.es'

INVALID_PASS = 'invalid'


WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do

       stub_request(:get, "http://api.adf.ly/api.php?key=#{VALID_KEY}&uid=#{VALID_UID}&url=").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})

      stub_request(:get, "http://api.adf.ly/api.php?key=#{VALID_KEY}&uid=#{VALID_UID}&url=#{VALID_LINK}").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "http://adf.ly/eY6Th", :headers => {})


      stub_request(:get, "http://api.adf.ly/api.php?advert_type=int&domain=q.gs&key=#{VALID_KEY}&uid=#{VALID_UID}&url=#{VALID_LINK}").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "http://q.gs/6kp3q", :headers => {})


  end
end


