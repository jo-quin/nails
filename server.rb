# frozen_string_literal: true

require 'socket'

PORT = '8080'

server = TCPServer.new('localhost', PORT)
puts "Nails server started on #{PORT}"
puts 'To stop the server enter CTRL+C'

while session = server.accept
  request = session.gets
  puts request

  session.print "HTTP/1.1 200\r\n"
  session.print "Content-Type: text/html\r\n"
  session.print "\r\n"
  session.print 'You nailed it!'

  session.close
end
