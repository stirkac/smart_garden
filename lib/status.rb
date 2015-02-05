require "dht-sensor-ffi"
val = DhtSensor.read(4, 22)
puts "---data---"
puts "{ 'temperature': '#{val.temp}', 'humidity':' #{val.humidity}'}"
