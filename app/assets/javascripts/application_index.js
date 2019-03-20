$(document).ready(function() {
  
  $(".task-header").click(function() {
    $(this).next().toggle(0)
  })
  
  $(".button-header-2").click(function() {
    $("#task-list-two").toggle()
  })

  $(".button-header-3").click(function() {
    $("#task-list-three").toggle()
  })

  $(".button-header-4").click(function() {
    $("#task-list-four").toggle()
  })

  document.getElementById('sortable-test-1').addEventListener("turbolinks:load", function(){
    
    console.log("turbolinks detected")
    $("#sortable-test-1").sortable();
  
  });

  document.addEventListener("turbolinks:load", function() {
    alert("ok!")
   });

})
