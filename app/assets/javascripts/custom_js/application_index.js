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
    $list.sortable({
      update: function(e, ui) {
        console.log($(this).sortable('serialize'));
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });
      }
    });

    $list = $("#task-list-three");
    console.log($list);
    $list.sortable({
      update: function(e, ui) {
        console.log($(this).sortable('serialize'));
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });
      }
    });

    $list = $("#task-list-four");
    console.log($list);
    $list.sortable({
      update: function(e, ui) {
        console.log($(this).sortable('serialize'));
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });
      }
    });



})
