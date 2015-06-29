# use ruby1.9.1 to run instead of ruby
require 'rubygems'
require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'tilt/erb'

def boot()
	set :port, 8080
	
	get '/' do
		erb :index
	end
	
	post '/results/' do
		# get the post data and append it to the url
		@query = params[:query]
		@url = "https://"+@query
		@file = open(@url)
		@flag = "Yes, it is up!"
		#add handler for 404 errors to rescue and flag as false
		erb :results
	end

	rescue OpenURI::HTTPError => e #handler for 404 and other errors
		if e.message == '404 Not Found'
			@flag = "Nope, it is down!"
			erb :results
		else
			raise e
		end
	end
end

boot()
