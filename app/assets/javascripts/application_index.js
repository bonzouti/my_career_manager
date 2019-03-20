$(document).ready(function() {

  console.log("bienvenue sur la page Index Applications.")
  
  $(".task-header").click(function() {
    $(this).next().toggle(0)
  })
  
  $(".button-header-2").click(function() {
    console.log("button-2 clicked");
    $("#task-list-two").toggle()
  })

  $(".button-header-3").click(function() {
    console.log("button-3 clicked");
    $("#task-list-three").toggle();
  })

  $(".button-header-4").click(function() {
    console.log("button-4 clicked");
    $("#task-list-four").toggle()
  })


  
    $("sortable-test-1").click(function(){
    console.log("turbolinks detected");
    $("#sortable-test-1").sortable();
  
  });

  document.addEventListener("turbolinks:load", function() {
    alert("ok!")
   });

})
