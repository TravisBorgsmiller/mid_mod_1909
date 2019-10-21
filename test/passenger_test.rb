require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/passenger'

class PassengerTest < Minitest::Test

  def setup
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  def test_instance_of_passenger_charlie

    assert_instance_of Passenger, @charlie
  end

  def test_instance_of_passenger_taylor

    assert_instance_of Passenger, @taylor
  end

  def test_does_it_initialize

    assert_equal "Charlie", @charlie.name
    assert_equal 18, @charlie.age
  end

  def test_is_adult_method

    assert_equal true, @charlie.adult?
    assert_equal false, @taylor.adult?
  end

  def test_is_a_driver

    assert_equal false, @charlie.driver?
    @charlie.drive
    assert_equal true, @charlie.driver?
  end

end
