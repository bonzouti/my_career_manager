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


    $textTohideIdentified = $('#explicative-text-identified')
    $list = $("#task-list-two");

    $list.sortable({
      update: function(e, ui) {
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });
        $textTohideIdentified.hide()
      }
    });


    $textTohideApplied = $('#explicative-text-applied')
    $list = $("#task-list-three");

    $list.sortable({
      update: function(e, ui) {
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });
        $textTohideApplied.hide()
      }
    });

    $textTohideInProgress = $('#explicative-text-in-progress')
    $list = $("#task-list-four");
    $list.sortable({
      update: function(e, ui) {
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });
        $textTohideInProgress.hide()
      }
    });

//Drag and drop on all 3 columns identified, applied, and in_progress
$('.task-list-items').sortable({
    connectWith: $('.task-list-items')
});



})
