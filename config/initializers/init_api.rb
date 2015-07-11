SmartGarden::Application.config.after_initialize do
  puts "Setting up API..."
  address = ENV['MOTHERSHIP_URL']+"/register_device"
  begin
	  device_status = HTTParty.post(address)
		response = case device_status.code
			when 304 then "#{address}: done: Sensor already registered!"
			when 200 then "#{address}: done: Sensor added and registered"
			else "#{address}: fail: Something went wrong (#{device_status.code})"
		end
		puts response
	rescue
		puts "local: fail: Something went wrong! Make sure internet connection is available"
	end
end
