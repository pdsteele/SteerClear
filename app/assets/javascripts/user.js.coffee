# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#a quick test - feel free to delete down the line
#jQuery ->
#    $(".address1").on "click", (e) ->
#        $('.ad2 :input').attr('disabled', true)
#        #alert "it worked!"


jQuery ->
  $("#onCampus").on "click", (e) ->
    #if address 2 is hidden, enable it
    if ($(".address2").is(":hidden"))
        $('.ad2 :input').removeAttr('disabled')


    $(".address1").slideToggle "fast"
    $(".address2").slideToggle "fast"

    #if address 2 is hidden after the toggle, disable it
    if ($(".address2").is(":hidden"))
        $('.ad2 :input').attr('disabled', true)


