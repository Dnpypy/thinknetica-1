require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'station'
require_relative 'route'
require_relative 'train'

puts '=========================================='
puts 'Creating simple Wagon, with wrong data'

def run_validation(object)
  object.validate!
rescue RuntimeError => e
  puts e.message
end

puts '1. Empty wagon type:'
wagon = Wagon.new ' '
run_validation wagon

puts '2. Wrong type format:'
wagon.type = 'Test'
run_validation wagon

puts '3. Wrong class type:'
wagon.type = 'Cargo'.to_sym
run_validation wagon