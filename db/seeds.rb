# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


shirt = Product.create(name: 'Shirt', price: 2.99, url: 'http://pjb3.github.io/betastore/products/shirt.jpg')
iphone_case = Product.create(name: 'IPhone', price: 3.75, url: 'http://pjb3.github.io/betastore/products/iphone_case.jpg')
hoodie = Product.create(name: 'Hoodie', price: 3.99, url: 'http://pjb3.github.io/betastore/products/hoodie.jpg')
journal = Product.create(name: 'Journal', price: 3.99, url: 'http://pjb3.github.io/betastore/products/journal.jpg')
sticker = Product.create(name: 'Sticker', price: 3.99, url: 'http://pjb3.github.io/betastore/products/sticker.jpg')
hat = Product.create(name: 'Hat', price: 3.99, url: 'http://pjb3.github.io/betastore/products/hat.jpg')
