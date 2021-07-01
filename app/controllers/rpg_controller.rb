class RpgController < ApplicationController
	def index
		session[:gold] ||= 0
		session[:info] ||= []
	end

	def farm
		@time = Time.now.strftime("%B %e, %Y %I:%M %p")
		gain = rand(10...21)
		session[:gold] += gain
		session[:info] << {
			pop: "Earned #{gain.to_s} golds at the farm.. (#{@time})",
		}
		p session[:info]
		redirect_to '/'
	end

	def cave
		@time = Time.now.strftime("%B %e, %Y %I:%M %p") 
		gain = rand(5...11)
		session[:gold] += gain
		session[:info] << {
			pop: "Earned #{gain.to_s} golds at the cave.. (#{@time})",
		}
		redirect_to '/'
	end

	def house
		@time = Time.now.strftime("%B %e, %Y %I:%M %p")
		gain = rand(2...6)
		session[:gold] += gain
		session[:info] << {
			pop: "Earned #{gain.to_s} golds at the house.. (#{@time})",
			color: "green"
		}
		redirect_to '/'
	end

	def casino
		@time = Time.now.strftime("%B %e, %Y %I:%M %p")
		gainLoss = rand(-50...51)
		session[:gold] += gainLoss
		if gainLoss == 0
			session[:info] << {
				pop: "Entered the casino and nothing... (#{@time})",
			}
		elsif gainLoss > 0
			session[:info] << {
				pop: "Earned #{gainLoss.to_s} golds at the casino.. (#{@time})",
			}
		else
			session[:info] << {
				pop: "Entered the casino and lost #{gainLoss.abs.to_s} golds.. Ouch.. (#{@time})",
			}
		end
		redirect_to '/'
	end
	def reset
		session[:gold] = 0
		session[:info] = []
		redirect_to '/'
	end
end