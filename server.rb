# typed: ignore
# Forks a web server into the background and then runs a WebSocket server
# in the foreground, keep track of the pid for clean shutdown.
require 'webrick'

def main
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

  examples = ["binary.rb", "ternary.rb", "random.rb", "figure_eight.rb"]
  index = ARGV.last.to_i
  system("bin/websocketd -port=8080 ruby #{examples[index]}")

  Process.kill('INT', pid)
end
