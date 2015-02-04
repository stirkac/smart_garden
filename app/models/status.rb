class Status < ActiveRecord::Base

	def initialize
		val = StatusLogger.log
		self[:temperature] = val.temp
		self[:humidity] = val.humidity
	end

end
