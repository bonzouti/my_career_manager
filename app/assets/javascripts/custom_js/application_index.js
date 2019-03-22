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

    $list = $("#task-list-two");
    console.log($list);
    $list.sortable();

    $list = $("#task-list-three");
    console.log($list);
    $list.sortable();

    $list = $("#task-list-four");
    console.log($list);
    $list.sortable();

  document.addEventListener("turbolinks:load", function() {
    alert("ok!")
   });

})
