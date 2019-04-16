$(document).ready(function() {
  
  $(".task-header").click(function() {
    $(this).nextAll().toggle(0)
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


    /*-------------------Column identified -----------------*/
    $explicativeTextIdentified = $("<p id='explicative-text-identified' class='text-white'> No identified job opportunity ! <br> You may want to check offers on your favourite job boards and 'Add' the most interesting here.</p>")
    $cardTextIdentified = $("<div class='card-body p-3'></div>")
    $cardTextIdentified.append($explicativeTextIdentified)
    $headerIdentified = $('.header-identified')

    $list = $("#task-list-two");

    if ($list.children().length == 0 ){

      $cardTextIdentified.insertAfter($headerIdentified)

    }

    $list.sortable({
      update: function(e, ui) {
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });

        $listIdentified = $("#task-list-two");
        $lengthIdentified = $listIdentified.children().length

        //increment or decrement the number displayed according to the drag and drop
        $countIdentified = $('#count-identified')
        $countIdentified.html('(' + $lengthIdentified + ')')

        //handles the explicative text appearance and disappearance while drag and dropping
        if ($lengthIdentified > 0 ){

          $cardTextIdentified.remove()

        }
        else{
          $cardTextIdentified.insertAfter($headerIdentified)

        } 
      }
    });



    /*-------------------Column Applied -----------------*/
    $explicativeTextApplied = $("<p id='explicative-text-applied' class='text-white'> You haven't applied to any offer. <br> Check applications on the 'identified' column and kick your ass ;).</p>")
    $cardTextApplied = $("<div class='card-body p-3'></div>")
    $cardTextApplied.append($explicativeTextApplied)
    $headerApplied = $('.header-applied')

    $list = $("#task-list-three");


    if ($list.children().length == 0 ){

      $cardTextApplied.insertAfter($headerApplied)

    }

    $list.sortable({
      update: function(e, ui) {
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });

        $listApplied = $("#task-list-three");
        $lengthApplied = $listApplied.children().length

        //increment or decrement the number displayed according to the drag and drop
        $countApplied = $('#count-applied')
        $countApplied.html('(' + $lengthApplied + ')')

        //handles the explicative text appearance and disappearance while drag and dropping
        if ($lengthApplied > 0 ){

          $cardTextApplied.remove()

        }
        else{
          $cardTextApplied.insertAfter($headerApplied)
        } 

      }
    });


    /*-------------------Column In Progress -----------------*/

    $explicativeTextInProgress = $("<p id='explicative-text-in-progress' class='text-white'> No running processes <br> It may be time to identify new opportunities.</p>")
    $cardTextInProgress = $("<div class='card-body p-3'></div>")
    $cardTextInProgress.append($explicativeTextInProgress)
    $headerInProgress = $('.header-in-progress')

    $list = $("#task-list-four");

    if ($list.children().length == 0 ){

      $cardTextInProgress.insertAfter($headerInProgress)

    }    

    $list.sortable({
      update: function(e, ui) {
        jQuery.ajax({
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        });

        $listInProgress = $("#task-list-four");
        $lengthInProgress = $listInProgress.children().length

        //increment or decrement the number displayed according to the drag and drop
        $countInProgress = $('#count-in-progress')
        $countInProgress.html('(' + $lengthInProgress + ')')

        //handles the explicative text appearance and disappearance while drag and dropping
        if ($lengthInProgress > 0 ){

          $cardTextInProgress.remove()

        }
        else{
          $cardTextInProgress.insertAfter($headerInProgress)

        } 


      }
    });

//Drag and drop on all 3 columns identified, applied, and in_progress
$('.task-list-items').sortable({
    connectWith: $('.task-list-items')
});



})
