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


    /*-------------------Column identified -----------------*/
    $explicativeTextIdentified = $("<p id='explicative-text-identified' class='text-white'> No identified job opportunity ! <br> You may want to check offers on your favourite job boards and 'Add' the most interesting here.</p>")
    $cardTextIdentified = $('.card-text-identified')
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

        $listIdentified = $("#task-list-two");

        if ($listIdentified.children().length > 0 ){

          $explicativeTextIdentified.remove()
          console.log('je cache le texte')

        }
        else{
          console.log('je dois montrer le texte')
          $cardTextIdentified.append($explicativeTextIdentified)

        } 
      }
    });



    /*-------------------Column Applied -----------------*/
    $explicativeTextApplied = $("<p id='explicative-text-applied' class='text-white'> You haven't applied to any offer. <br> Check applications on the 'identified' column and kick your ass ;).</p>")
    $cardTextApplied = $('.card-text-applied')
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


        $listApplied = $("#task-list-three");

        if ($listApplied.children().length > 0 ){

          $explicativeTextApplied.remove()
          console.log('je cache le texte')

        }
        else{
          console.log('je dois montrer le texte')
          $cardTextApplied.append($explicativeTextApplied)

        } 

      }
    });


    /*-------------------Column In Progress -----------------*/

    $explicativeTextInProgress = $("<p id='explicative-text-in-progress' class='text-white'> No running processes <br> It may be time to identify new opportunities.</p>")
    $cardTextInProgress = $('.card-text-in-progress')
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

        $listInProgress = $("#task-list-four");

        if ($listInProgress.children().length > 0 ){

          $explicativeTextInProgress.remove()
          console.log('je cache le texte')

        }
        else{
          console.log('je dois montrer le texte')
          $cardTextInProgress.append($explicativeTextInProgress)

        } 


      }
    });

//Drag and drop on all 3 columns identified, applied, and in_progress
$('.task-list-items').sortable({
    connectWith: $('.task-list-items')
});



})
