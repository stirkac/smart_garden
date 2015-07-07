SmartGarden::Application.config.after_initialize do
  puts "Setting up API..."
  begin
	  device_status = HTTParty.post(ENV['MOTHERSHIP_URL']+"/register_device")
		response = case device_status.code
			when 304 then "remote: done: Sensor already registered!"
			when 200 then "remote: done: Sensor added and registered"
			else "remote: fail: Something went wrong (#{device_status.code})"
		end
		puts response
	rescue
		puts "local: fail: Something went wrong! Make sure internet connection is available"
	end
end
