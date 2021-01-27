# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


3.times do |customer|
  Customer.create!(
    last_name: "テスト",
    first_name: "太郎#{customer + 1}",
    last_name_kana: "テスト",
    first_name_kana: "タロウ#{customer + 1}",
    gender: 0,
    age: customer + 20,
    email: "test#{customer + 1}@test.com",
    password: "test11#{customer}",
    postal_code: "111111#{customer}",
    address: "東京都#{customer}",
    telephone_number: "0801111111#{customer}"
  )
end