# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

User.create(email: 'administrator@example.com',
            password: 'adminconfidence',
            admin: 1)

CSV.foreach('db/csv_data/genre.csv', headers: true) do |row|
  Genre.create(:id => row[0], :name => row[1])
end

CSV.foreach('db/csv_data/area.csv', headers: true) do |row|
  Area.create(:id => row[0], :name => row[1])
end
