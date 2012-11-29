class TestController < ApplicationController

	def index
		@values = [ENV['JAVA_HOME'], ENV['TEST']]
	end

end