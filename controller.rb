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
		@res = "Unknown..."
		if (@req.code.to_i < 400) then @res = "Green: Site is up" end
		erb :results
	end
	
	error do
		@res = "Red: Site not found"
		erb :results
	end
end

boot()
