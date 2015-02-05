require 'json'

module DhtSensorReader
  def get_dht_sensor_reading
  	result = %x( rvmsudo ruby status.rb )
  	return JSON.parse(result.split("---data---")[-1])
  end
end
