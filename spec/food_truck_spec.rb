require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  describe 'instantiation' do
    it '::new' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck).to be_an_instance_of(FoodTruck)
    end

    it 'has attributes' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck = FoodTruck.new("Rocky Mountain Pies")

     expect(food_truck.name).to eq("Rocky Mountain Pies")
     expect(food_truck.inventory).to eq({})
   end
 end
 describe 'methods' do
    it '#check stock by item' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.check_stock(item1)).to eq(0)
    end
    it '#stocks inventory' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      food_truck.stock(item1, 30)

      expect(food_truck.inventory).to eq({item1 => 30})
      expect(food_truck.check_stock(item1)).to eq(30)
    end

    it '#stocks more inventory' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      food_truck.stock(item1, 30)
      food_truck.stock(item1, 25)
      food_truck.stock(item2, 12)

      expect(food_truck.check_stock(item1)).to eq(55)
      expect(food_truck.inventory).to eq({item1 => 55, item2 => 12})
    end

    it '#potential revenue' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      food_truck.stock(item1, 30)
      food_truck.stock(item1, 25)
      food_truck.stock(item2, 12)

      expect(food_truck.potential_revenue.class).to eq(Float)
    end

    xit '#sum items' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      food_truck.stock(item1, 30)
      food_truck.stock(item1, 25)
      food_truck.stock(item2, 12)

      expect(food_truck.sum).to eq(Integer)
    end



  end
end
