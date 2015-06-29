# use ruby1.9.1 to run instead of ruby
require 'rubygems'
require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'tilt/erb'
require 'net/http'

def boot()
	set :port, 8080
	# disable :show_exceptions
	
	get '/' do
		erb :index
	end
	
	post '/results/' do
		# get the post data and append it to the url
		@query = params[:query]
		@addr = "http://www."+@query+"/"
		puts "Requesting "+@addr+" ..."
		url = URI.parse(@addr)
		req = Net::HTTP.new(url.host, url.port)
		res = req.request_head(url.path)
		# puts res.code
		@flag = "It is down!"
		puts res.code # will need to handle multiple different http codes
		if (res.code == "200") then (@flag = "It is up!") end
		erb :results
	end

	rescue Exception
		puts "I refuse to fail!"
end

boot()
