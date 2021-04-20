class Event
  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    names = @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    trucks = @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def truck_price_sum(item)
    food_trucks_that_sell(item)
  end

  def total_inventory
    hash = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        #require "pry"; binding.pry
        hash[item] = {
          quantity: truck.sum,#need helper method
            food_trucks: food_trucks_that_sell(item)
          }
      end
    end
    hash
  end
end
