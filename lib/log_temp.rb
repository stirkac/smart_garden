require "dht-sensor-ffi"

class StatusLogger
	def log
		val = DhtSensor.read(4, 22)
	end
end
