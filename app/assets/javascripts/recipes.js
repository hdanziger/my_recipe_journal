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


  $(function() {
    $('#new_comment').on('submit', function(e) {
       $.ajax({
          type: "POST",
          url: this.action + ".json",
          data: $(this).serialize(),
          datatype: "json"
        }).done(function(data) {
           $("#comment_text").val("");

          var comment = data;
            let newComment= new Comment(comment)
            let commentHtml = newComment.formatShow()
            $('.comments').append(commentHtml)
          })
          e.preventDefault();
          return false
          })
        })

  function Comment(comment) {
    this.id = comment.id
    this.text = comment.text
    this.user = comment.user
    this.recipe_id = comment.recipe_id
  }

  Comment.prototype.formatShow = function() {
    let commentHtml = `
      <li>${this.text}</li>
      written by: ${this.user.email}<br><br>
    `
    return commentHtml
  }

  //`/recipes/${comment.recipe_id}/comments/${comment.id}`
