$(function() {
  $(".js-more").one("click", function() {
    var id = $(this).data("id");
    $.get("/recipes/" + id + ".json", function(data) {
      var recipe = data;
      for(let i = 0; i < data.ingredients.length; i++) {
        var ingredientText = "<li>" + data.ingredients[i].name + "</li>"
        $("#recipe-" + id).append(ingredientText)

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
