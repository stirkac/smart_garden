class Status < ActiveRecord::Base

  validates_presence_of :temperature
  validates_presence_of :humidity

  scope :last_day, ->(){ where(created_at: (Time.now - 24.hours)..Time.now) }

	def make_reading
		current_status = DhtSensorReader.get_dht_sensor_reading Rails.root
		last_status = Status.order(:created_at).last
		delta_t = last_status.temperature - current_status['temperature'].to_f rescue 1
		delta_h = last_status.humidity - current_status['humidity'].to_f rescue 1

		if(delta_t.abs > 0.5 || delta_h.abs > 1)
			self[:temperature] = current_status['temperature']
			self[:humidity] = current_status['humidity']
			self.save!
		end
	end

end
