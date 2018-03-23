$(function() {
  $(".js-more").one("click", function() {
    var id = $(this).data("id");
    $.get("/recipes/" + id + ".json", function(data) {
      var recipe = data;
      for(let i = 0; i < recipe.ingredients.length; i++) {
        var ingredientText = "<li>" + "<strong>" + "Ingredient: " + "</strong>" + recipe.ingredients[i].name + "</li>"
        $("#recipe-" + id).append(ingredientText)
      };
        for(let i = 0; i < recipe.comments.length; i++) {
        var commentText = "<li>" +  "<strong>" + "Comment: " + "</strong>" + recipe.comments[i].text + "</li>"
        $("#recipe-" + id).append(commentText)
      };
    })
    })
  })

  // ----------------------------------------------------------

  $(function () {
    $('form').on('submit', function (e) {
       $.ajax({
          type: "POST",
          url: this.action,
          data: $(this).serialize(),
          success: function () {
            debugger
        }
      })
        e.preventDefault();
    })
  })
