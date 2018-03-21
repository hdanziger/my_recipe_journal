// $(() => {
//   attachListeners()
// })
//
// const attachListeners = () => {
//   $('.all_recipes').on('click', (e) => {
//     e.preventDefault()
//     console.log('hello')
//   })
// }

function Recipe(recipe) {
  this.id = recipe.id
  this.title = recipe.title
  this.meal = recipe.meal
  this.meal = recipe.meal
  this.user_id = recipe.user_id
  this.ingredients = recipe.ingredients
  this.comments = recipe.comments
}
