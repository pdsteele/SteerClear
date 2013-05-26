# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#in order to autoload correct fields when editing
#if $("#onCampus").is(":checked")
#  $(".ad2 :input").removeAttr "disabled"
#  $(".address1").slideToggle "fast"
#  $(".address2").slideToggle "fast"

#repeated for second address field in ride requests
#if $("#onCampus2").is(":checked")
#  $(".ad22 :input").removeAttr "disabled"
#  $(".address12").slideToggle "fast"
#  $(".address22").slideToggle "fast"


#for address field selection between on and off campus
#jQuery ->
#  $("#onCampus").on "click", (e) ->
#    #if address 2 is hidden, enable it
#    if ($(".address2").is(":hidden"))
#      $('.ad2 :input').removeAttr('disabled')
#    else
#      $('.ad2 :input').attr('disabled', true)
#
#    $(".address1").slideToggle "fast"
#    $(".address2").slideToggle "fast"

#repeated for second address field in ride request creation
#jQuery ->
#  $("#onCampus2").on "click", (e) ->
#    #if address 2 is hidden, enable it
#    if ($(".address22").is(":hidden"))
#      $('.ad22 :input').removeAttr('disabled')
#    else
#      $('.ad22 :input').attr('disabled', true)
#
#    $(".address12").slideToggle "fast"
#    $(".address22").slideToggle "fast"

#in order to autoload correct fields when editing
if $("#onCampus").is(":checked")
  $(".ad2 :input").removeAttr "disabled"
  $(".address1").slideToggle "fast"
  $(".address2").slideToggle "fast"

#repeated for second address field in ride requests
if $("#onCampus2").is(":checked")
  $(".ad22 :input").removeAttr "disabled"
  $(".address12").slideToggle "fast"
  $(".address22").slideToggle "fast"

#repeated for location update field
if $("#onCampus3").is(":checked")
  $(".ad23 :input").removeAttr "disabled"
  $(".address13").slideToggle "fast"
  $(".address23").slideToggle "fast"


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

#repeated for second address field in ride request creation
jQuery ->
  $("#onCampus2").on "click", (e) ->
    #if address 2 is hidden, enable it
    if ($(".address22").is(":hidden"))
      $('.ad22 :input').removeAttr('disabled')
    else
      $('.ad22 :input').attr('disabled', true)

    $(".address12").slideToggle "fast"
    $(".address22").slideToggle "fast"

#repeated for address update field
jQuery ->
  $("#onCampus3").on "click", (e) ->
    #if address 2 is hidden, enable it
    if ($(".address23").is(":hidden"))
      $('.ad23 :input').removeAttr('disabled')
    else
      $('.ad23 :input').attr('disabled', true)

    $(".address13").slideToggle "fast"
    $(".address23").slideToggle "fast"




