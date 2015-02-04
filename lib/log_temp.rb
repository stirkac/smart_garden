require "dht-sensor-ffi"
val = DhtSensor.read(4, 22)
puts val.temp
puts val.temp_f
puts val.humidity
