require "net/http"

def test()
	puts "Enter website name (example: google.com):"
	@name = gets.chomp
	@url = "http://www."+@name+"/"
	puts "Checking "+@url+"..."
	@req = Net::HTTP.get_response(URI.parse(@url))
	@code = ""
	if (@req.code.to_i < 400) then @code = "Green: Site is up" end
	puts @code
	rescue
		puts "Red: Site not found"
end

test()
