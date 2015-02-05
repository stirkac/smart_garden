require 'dht-sensor-ffi'
require 'json'
val = DhtSensor.read(4, 22)
puts '---data---'
puts val.to_json
