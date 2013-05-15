# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#onCampus").on "click", (e) ->
    $(".address1").slideToggle "fast"

    $('.address2').html("<%= escape_javascript(render( :partial => 'address_form' )) %>")
    $(".address2").slideToggle "fast"
