class SolvesController < ApplicationController
	def index 
		@solve = Solve.all
	end
	def new 
		@solve = Solve.new
	end
end
