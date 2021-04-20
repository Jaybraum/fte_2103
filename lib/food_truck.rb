class FoodTruck
  attr_reader :name,
              :inventory,
              :stock
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory.include?(item)
      inventory[item]
    else
      0
    end
  end

  def stock(item, count)
    @inventory[item] += count
  end

  def potential_revenue
    total = @inventory.map do |item, count|
      item.price.delete('$').to_f * count
    end
    total.sum
  end

  def item_sum
  end
end
