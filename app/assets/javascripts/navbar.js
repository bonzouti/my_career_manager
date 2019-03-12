$( document ).ready(function() {
    console.log( "ready!" );

    //définition du lien à bouger
    $movingLink = $('.movinglink')

    //définition de l'ul qui va accueillir le lien
    $listInToggleButton = $('.togglelist')

    $navbrand = $('.navbar-brand')


	if (window.matchMedia("(max-width: 700px)").matches) {

	  			$movingLink.detach()
		    	$movingLink.appendTo($listInToggleButton)
		    	$navbrand.hide()
		}

});