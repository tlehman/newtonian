require 'webrick'

PORT = 8000
rd, wt = IO.pipe

# Run HTTP Server in background process
pid = fork do
  rd.close
  server = WEBrick::HTTPServer.new({
    :Port => PORT,
    :BindAddress => "localhost",
    :StartCallback => Proc.new {
      wt.write(1)  # write "1", signal a server start message
      wt.close
    }
  })
  trap('INT') { server.stop }
  server.mount("/", WEBrick::HTTPServlet::FileHandler, './examples')
  server.start
end


puts "after server starts up"
wt.close
rd.read(1)   # read a byte for the server start signal
rd.close



Process.kill('INT', pid)

