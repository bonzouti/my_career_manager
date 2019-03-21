

$( document ).ready(function() {


    //definition of the links to move on large screen
    $largesizeLink = $('.lg-link')

    //definition of the links to move on small screen
    $smallsizeLink = $('.sm-link')

    $navbrand = $('.navbar-brand')

    $smallMenu = $('#sm-menu')

    $togglerButton = $('.navbar-toggler')


	if (window.matchMedia("(max-width: 700px)").matches) {

	  			$largesizeLink.hide()
		    	$navbrand.css("padding-left", "10px")

                $togglerButton.click(function(){
                    $navbrand.toggle()
                });

		}

    if (window.matchMedia("(min-width: 700px)").matches) {

            $smallsizeLink.css("display", "none");
    }


/* -------------------NEXT-STEP SHOW ---------------------------- */

//Method to keep the checkbox unchecked even when there is an alert popping
$checkboxStep = $('.checkbox-step')

$checkboxStep.click(function() {
  console.log("click checked");
  $checkboxStep.prop('checked', false);
});

});