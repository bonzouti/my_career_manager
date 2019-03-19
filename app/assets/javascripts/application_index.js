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

/*
  $("#status-header-2").click(function() {
    $("#task-list-two").toggle(200)
  })

  $("#status-header-3").click(function() {
    $("#task-list-three").toggle(200)
  })

  $("#status-header-4").click(function() {
    $("#task-list-four").toggle(200)
  })
*/
})
