# frozen_string_literal: true

require 'socket'

PORT = '8080'

TCPServer.new('localhost', PORT)
puts "Nails server started on #{PORT}"
puts 'To stop the server enter CTRL+C'
