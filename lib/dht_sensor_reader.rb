require 'json'
module DhtSensorReader
  def get_dht_sensor_reading rails_root
  	result = %x( rvmsudo ruby #{rails_root}/lib/status.rb )
  	return JSON.parse(result.split("---data---")[-1])
  end
end
