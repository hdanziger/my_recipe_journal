$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
$('.user_recipes').on('click', (e) => {
  e.preventDefault()
  var id = $(this).data("id");
  debugger
  fetch(`/recipes.json`)
  .then(res => res.json())
  .then(data => console.log(data))
})
}

$(function() {
  $(".js-more").on("click", function() {
    var id = $(this).data("id");
    $.get("/recipes/" + id + ".json", function(data) {
      var recipe = data;
      for(let i = 0; i < data.ingredients.length; i++) {
        var ingredientText = "<li>" + data.ingredients[i].name + "</li>"
        $("#recipe" + id).append(ingredientText)

      };
    })
    })
  })

$(function() {
  $("#new_comment").on("submit", function(event){
    //  $.ajax({
    // type: ($("input[name='_method']").val() || this.method),
    //  url: url
    //  data: $(this).serialize(),
    //  success: function(response){
    //    $("#comment_text").val("");
       // var $ul = $("div.comments ul")
       // $ul.append(response);

   //   }
   // });
    event.preventDefault();
  })
})


function Recipe(recipe) {
  this.id = recipe.id
  this.title = recipe.title
  this.meal = recipe.meal
  this.meal = recipe.meal
  this.user_id = recipe.user_id
  this.ingredients = recipe.ingredients
  this.comments = recipe.comments
}
