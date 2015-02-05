class Status < ActiveRecord::Base
	def make_reading
		current_status = DhtSensorReader.get_dht_sensor_reading Rails.root
		self[:temperature] = current_status['temperature']
		self[:humidity] = current_status['humidity']
	end
end
