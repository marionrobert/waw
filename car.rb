class Car
  def initialize(color: "Blue")
    @speed = 0
    @color = color
  end

  def accelerate
    @speed += 10
  end

  def self.create_black
    new(color: "Black")
  end
end

p blue_car = Car.new()
p green_car = Car.new(color:"Green")
p black_car = Car.create_black

blue_car.accelerate
p blue_car

# p Car.accelerate # undefined method `accelerate' for Car:Class (NoMethodError)
# p blue_car.create_black # undefined method `create_black' for #<Car:0x00007fb30d8dcc38 @speed=10, @color="Blue"> (NoMethodError)
