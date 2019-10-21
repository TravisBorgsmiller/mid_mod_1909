require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/passenger'
require './lib/vehicle'

class VehicleTest < Minitest::Test

  def test_instance_of_vehicle

    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_instance_of Vehicle, vehicle
  end

  def test_does_it_initialize

    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal "2001", vehicle.year
    assert_equal "Honda", vehicle.make
    assert_equal "Civic", vehicle.model
  end

  def test_is_speeding

    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal false, vehicle.speeding?
    vehicle.speed
    assert_equal true, vehicle.speeding?
  end

  def test_can_we_add_passengers

    vehicle = Vehicle.new("2001", "Honda", "Civic")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    assert_equal [], vehicle.passengers
    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)
    assert_equal [charlie, jude, taylor], vehicle.passengers
    assert_equal 2, vehicle.num_adults
  end

  # def test_number_of_adults
  #   assert_equal 2, vehicle.num_adults

end
