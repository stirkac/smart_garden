require 'json'
module DhtSensorReader
  def self.get_dht_sensor_reading rails_root
  	result = %x( rvmsudo ruby #{rails_root}/lib/reader.rb )
  	return JSON.parse(result.split("---data---")[-1])
  end
end
