# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#in order to autoload correct fields when editing
if $("#onCampus").is(":checked")
  $(".ad2 :input").removeAttr "disabled"
  $(".address1").slideToggle "fast"
  $(".address2").slideToggle "fast"


#for address field selection between on and off campus
jQuery ->
  $("#onCampus").on "click", (e) ->
    #if address 2 is hidden, enable it
    if ($(".address2").is(":hidden"))
      $('.ad2 :input').removeAttr('disabled')
    else
      $('.ad2 :input').attr('disabled', true)

    $(".address1").slideToggle "fast"
    $(".address2").slideToggle "fast"




