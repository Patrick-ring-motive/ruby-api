require_relative 'api/index'
require 'webrick'

if ENV['PATH'].include?('runner')
  server = WEBrick::HTTPServer.new Port: 8000
  # trap 'INT' do server.shutdown end

  server.mount_proc '/' do |req, res|
    Handler[req, res]
  end

  server.start
end
