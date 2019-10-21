class Passenger

  attr_reader :name,
              :age

  def initialize(hash)
    @name = hash["name"]
    @age = hash["age"]
    @driver = false
  end

  def adult?
    @age >= 18
  end

  def driver?
    @driver
  end

  def drive
    @driver = true
  end 

end
