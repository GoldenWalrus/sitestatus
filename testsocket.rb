require "net/http"

def test()
	url = URI.parse("http://www.google.com/")
	req = Net::HTTP.new(url.host, url.port)
	res = req.request_head(url.path)
	# puts res.code
	flag = "It is down!"
	if (res.code == "200") then (flag = "It is up!") end
	puts flag

	rescue Exception
		puts "Error!"
end

test()
