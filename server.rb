# frozen_string_literal: true

require 'socket'

PORT = '8080'

server = TCPServer.new('localhost', PORT)
puts "Nails server started on #{PORT}"
puts 'To stop the server enter CTRL+C'

client = server.accept
request = client.readpartial(2048)
puts request
