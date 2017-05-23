# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 1 - expensive
# 2 - portable
# 3 - game

CategoryCompter.create!([
                        {category_id: 1, compter_id: 1},
                        {category_id: 1, compter_id: 2},
                        {category_id: 1, compter_id: 6}
                        ])

CategoryCompter.create!([
                        {category_id: 2, compter_id: 2},
                        {category_id: 2, compter_id: 3},
                        {category_id: 2, compter_id: 4},
                        {category_id: 2, compter_id: 13}
                        ])

CategoryCompter.create!([
                        {category_id: 3, compter_id: 3},
                        {category_id: 3, compter_id: 5}
                        ])