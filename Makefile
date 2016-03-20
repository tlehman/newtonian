# Downloads websocketd and builds newtonian library to serve up
# example simulations in the browser.

twobody: server.rb
	ruby server.rb

server.rb: bin/websocketd newtonian-0.1.0.gem	
	gem install newtonian

newtonian-0.1.0.gem:
	gem build newtonian

bin/websocketd: tmp/websocketd.zip
	unzip -o tmp/websocketd.zip -d tmp
	mv tmp/websocketd bin/websocketd

tmp/websocketd.zip:
	bin/download_websocketd.sh

clean:
	rm -rf tmp
	rm newtonian-0.1.0.gem	
	gem uninstall newtonian

