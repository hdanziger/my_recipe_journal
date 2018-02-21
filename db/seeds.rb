# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
    email: "hannah@email.com",
    password: "123456")

Recipe.create([
    {:title => "Mac 'n Cheese",:user_id => 1,
        ingredients_attributes: [
        {name: "Cheese"},    
        {name: "Milk"},
        {name: "Noodles"}
            ]
    },
    {:title => "Lemon Chicken",:user_id => 1,
        ingredients_attributes: [
        {name: "Chicken"},    
        {name: "Lemon"}
    ]
    }
    ])
    
