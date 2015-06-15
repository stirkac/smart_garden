class Status < ActiveRecord::Base

  validates_presence_of :temperature
  validates_presence_of :humidity

  scope :last_day, ->(){ where(created_at: (Time.now - 24.hours)..Time.now) }

	def make_reading
		current_status = get_data
		self[:temperature] = current_status.temperature
		self[:humidity] = current_status.humidity
		if Status.all.count < 1
			self.save!
		else
			last_status = Status.order(:created_at).last
			delta_t = last_status.temperature - current_status.temperature
			delta_h = last_status.humidity - current_status.humidity
			# saving only what is worth saving
			if (delta_t.abs > 0.5 || delta_h.abs > 1) && delta_h.abs < 10 && delta_t.abs < 10
				self.save!
			end
		end
	end

	def get_data
		# we only execute reading from sensor on RaspberryPi in production
  	if Rails.env.production?
  		# GPIO requires sudo access, so we have to work around it 
  		return Status.new(JSON.parse(%x(rvmsudo ruby #{ Rails.root.join('lib', 'reader.rb') }))) 
  	else
  		return Status.new(temperature: Random.new.rand(30) , humidity: Random.new.rand(100))
  	end
	end

end
