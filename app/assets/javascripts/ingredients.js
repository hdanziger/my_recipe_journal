$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
$('.all_ingredients').on('click', (e) => {
  e.preventDefault()
  history.pushState(null, null, "ingredients")
  fetch(`/ingredients.json`)
  .then(res => res.json())
  .then(data => {
    $('#app-container').html('')
    data.forEach((ingredient) => {
      let newIngredient = new Ingredient(ingredient)
      let ingredientHtml = newIngredient.formatIndex()
      $('#app-container').append(ingredientHtml)
    })
  })

})
}

function Ingredient(ingredient) {
  this.id = ingredient.id
  this.name = ingredient.name
  this.recipes = ingredient.recipes
}

Ingredient.prototype.formatIndex = function() {
  let ingredientHtml = `
    <li>${this.name}</li>
  `
  return ingredientHtml
}
