require 'sinatra'
require_relative 'config'

class Item
  attr_reader :name, :category, :price, :orders

  def initialize(name, category, price)
    @name = name
    @category = category
    @price = price
    @orders = []
  end

  def add_order(buyer)
    @order = Order.new(buyer)
  end
end

class Order
  attr_reader :buyer

  def initialize(buyer)
    @buyer = buyer
  end
end

items = []

get '/' do
  'This is the home page. You will see this if you don\'t specify any specific route.'
end

get '/messages' do
  erb :message, locals: {
    name: 'GenerasiGIGIH',
    color: 'DodgerBlue'
  }
end

get '/messages/:name' do
  name = params['name']
  color = params['color'] ? params['color'] : 'DodgerBlue'
  erb :message, locals: {
    name: name,
    color: color
  }
end

get '/login' do
  erb :login
end

post '/login' do
  if params['username'] == 'admin' && params['password'] == 'admin'
    return 'Logged in!'
  else
    redirect '/login'
  end
end

get '/items/new' do
  erb :new
end

# post '/items' do
#   erb :item, locals: {
#     name: params['name'],
#     category: params['category'],
#     price: params['price']
#   }
# end

post '/items' do
  items = Item.new(params['name'], params['category'], params['price'])
  redirect '/items/%d' % [items.length() - 1]
end

get '/items/:index' do
  item_index = Integer(params['index'])
  if item_index < items.length()
    erb :item, locals: {
      name: items[item_index].name,
      category: items[item_index].category,
      price: items[item_index].price,
      id: item_index
    }
  else
    erb :item_not_found
  end
end

get 'items/:index/orders' do
  item_index = Integer(params[index])
  if item_index < items.length()
    erb :order_new, locals: {
      name: items[item_index].name,
      category: items[item_index].category,
      price: items[item_index].price,
      order: items[item_index].orders,
      id: item_index
    }
  else
    erb :item_not_found
  end
end

post 'items/:index/orders' do
  item_index = Integer(params[index])
  if item_index < items.length()
    items[item_index].add_order(params['buyer'])
    erb :order, locals: {
      buyer: params['buyer']
    }
  else
    erb :item_not_found
  end
end

get 'items/:index/orders/:order_index' do
  item_index = Integer(params['index'])
  order_index = Integer(params['order_index'])
  if item_index < items.length()
    if order_index < items[item_index].orders.length()
      erb :order, locals: {
        buyer: items[item_index].orders[order_index].buyer
      }
    else
      erb :order_not_found
    end
  else
    erb :order_not_found
  end
end




