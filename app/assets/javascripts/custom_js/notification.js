$( document ).ready(function() {

    //close the notification automatically after a certain time
    $cardToDisplay = $('.jq-has-icon')
    $buttonToCloseAlert = $('.close-jq-toast-single')

    setTimeout(function() {

      $($cardToDisplay).css({

                    display: 'none'
      });

          }, 4000);


    // On click on the cross the notification is hidden 
    $($buttonToCloseAlert).click(function() {

          $($cardToDisplay).css({
          display: 'none'
        });

    });

});