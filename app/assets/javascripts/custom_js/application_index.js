$(document).ready(function() {
  
  $(".task-header").click(function() {
    $(this).next().toggle(0)
  })
  
  $(".button-header-2").click(function() {
    $("#task-list-two").toggle()
  })

  $(".button-header-3").click(function() {
    $("#task-list-three").toggle();
  })

  $(".button-header-4").click(function() {
    $("#task-list-four").toggle()
  })


//-------------- Drag and drop--------------------------

    $list = $("#task-list-two");
    $list.sortable({
      update: function(e, ui) {
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });
      }
    });

    $list = $("#task-list-three");
    $list.sortable({
      update: function(e, ui) {
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });
      }
    });

    $list = $("#task-list-four");
    $list.sortable({
      update: function(e, ui) {
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });
      }
    });

//Drag and drop on all 3 columns identified, applied, and in_progress
$('.task-list-items').sortable({
    connectWith: $('.task-list-items')
});



})
