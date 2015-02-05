require "dht-sensor-ffi"
val = DhtSensor.read(4, 22)
puts "{ temperature: #{val.temp}, humidity:#{val.humidity} }"
