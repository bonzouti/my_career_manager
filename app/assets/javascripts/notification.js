$( document ).ready(function() {


/*---------------------SUCCESS NOTIFICATION-------------------------- */

    $buttonToDisplayAlert =  $('.btn-alert-success')
    $cardToDisplay = $('.jq-has-icon')
    $buttonToCloseAlert = $('.close-jq-toast-single')

    //On click the notification message is shown and closed
    $($buttonToDisplayAlert).click(function() {

          $($cardToDisplay).css({
          display: 'block'
        });

          setTimeout(function() {

          $($cardToDisplay).css({
                    display: 'none'
                  });

    }, 4000);


    });

    // On click on the cross the notification is hidden 
    $($buttonToCloseAlert).click(function() {

          $($cardToDisplay).css({
          display: 'none'
        });

    });

});