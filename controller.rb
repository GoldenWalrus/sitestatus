# use ruby1.9.1 to run instead of ruby
require 'rubygems'
require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'tilt/erb'
require 'net/http'

def boot()
	set :port, 8080
	disable :show_exceptions
	
	get '/' do
		erb :index
	end

	post '/results/' do
		# get the post data and append it to the url
		@query = params[:query]
		@addr = "http://www."+@query+"/"
		puts "Requesting "+@addr+" ..."
		@req = Net::HTTP.get_response(URI.parse(@addr))
		@res = "<p style='color:red;'>Site not found</p>"
		if (@req.code.to_i < 400) then @res = "<p style='color:green;'color:red;>Site is up</p>" end
		erb :results
	end
	
	error do
		@res = "<p style='color:red;'>Site not found</p>"
		erb :results
	end
end

boot()
