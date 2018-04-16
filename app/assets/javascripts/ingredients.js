$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
$('.all_ingredients').on('click', e => {
  e.preventDefault()
  history.pushState(null, null, "/ingredients")
  fetch(`/ingredients.json`)
  .then(res => res.json())
  .then(data => {
    $('#app-container').html('')
    data.forEach(ingredient => {
      const newIngredient = new Ingredient(ingredient)
      const ingredientHtml = newIngredient.formatIndex()
      $('#app-container').append(ingredientHtml)
    })
    renderIngredientsMeal();
  })

})
}

function Ingredient(ingredient) {
  this.id = ingredient.id
  this.name = ingredient.name
  this.recipes = ingredient.recipes
}

Ingredient.prototype.formatIndex = function() {
  return `
    <li>${this.name}</li>
  `
}


$(() => {
  renderIngredientsMeal();
})


const renderIngredientsMeal = () => {
  $('.js-meals').on('click', e => {
    e.preventDefault();
    $('#app-container').html('')
    $.get(`/ingredients.json`, function(data) {
      const ingredients = data.filter(ingredient => ingredient.recipes[0].meal === "Dinner")
      ingredients.forEach(ingredient => {
        const newIngredient = new Ingredient(ingredient)
        const ingredientHtml = newIngredient.formatIndex()
        $('#app-container').append(ingredientHtml)
      })
    })
  })
}

// filter list
// ingredxcits meals dinner
// append list
