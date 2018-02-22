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
    { title: "Mac n' Cheese", meal: "snack", user_id: 1}, 
    { title: 'Lemon Chicken', meal: "dinner", user_id: 1}
    ])

Ingredient.create([ 
    {name: "Cheese", recipe_id: 1}, 
    {name: "Noodles", recipe_id: 1},
    {name: "Milk", recipe_id: 1}, 
    {name: "Chicken", recipe_id: 2}, 
    {name: "Lemon", recipe_id: 2}
    ])  

    
