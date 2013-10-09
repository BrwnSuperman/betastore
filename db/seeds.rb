# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
me = Customer.create(name: 'Paul Barry', email: 'mail@paulbarry.com')
test = Customer.create(name: 'John Doe', email: 'test@example.com')
Customer.create(name: 'Nowhere Man', email: 'man@nowhere.com')

Shirt = Product.create(name: 'Shirt', price: 2.99, url: 'http://pjb3.github.io/betastore/products/shirt.jpg')
IPhone = Product.create(name: 'IPhone', price: 3.75, url: 'http://pjb3.github.io/betastore/products/iphone_case.jpg')
Hoodie = Product.create(name: 'Hoodie', price: 3.99, url: 'http://pjb3.github.io/betastore/products/hoodie.jpg')
Journal = Product.create(name: 'Journal', price: 3.99, url: 'http://pjb3.github.io/betastore/products/journal.jpg')
Sticker = Product.create(name: 'Sticker', price: 3.99, url: 'http://pjb3.github.io/betastore/products/sticker.jpg')
Hat = Product.create(name: 'Hat', price: 3.99, url: 'http://pjb3.github.io/betastore/products/hat.jpg')

order = Order.create(customer: me, placed_at: '2013-09-27')
LineItem.create(order: order, quantity: 1, product: hat)
LineItem.create(order: order, quantity: 1, product: hoodie)

order = Order.create(customer: me, placed_at: Time.current)
LineItem.create(order: order, quantity: 1, product: iphone_case)

order = Order.create(customer: test, placed_at: Time.current)
LineItem.create(order: order, quantity: 1, product: journal)
LineItem.create(order: order, quantity: 1, product: shirt)
LineItem.create(order: order, quantity: 1, product: sticker)