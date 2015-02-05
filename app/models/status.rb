class Status < ActiveRecord::Base

  validates_presence_of :temperature
  validates_presence_of :humidity

  scope :last_day, ->(){ where("datetime(created_at) > datetime('now', '-1 day')") }

	def make_reading
		current_status = DhtSensorReader.get_dht_sensor_reading Rails.root
		last_status = Status.order(:created_at).last
		delta_t = last_status.temperature - current_status['temperature'].to_f
		delta_h = last_status.humidity - current_status['humidity'].to_f

		if(delta_t.abs > 0.5 || delta_h.abs > 0.5)
			self[:temperature] = current_status['temperature']
			self[:humidity] = current_status['humidity']
			self.save!
		end
	end

end
