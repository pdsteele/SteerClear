# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#defaultBounds = new google.maps.LatLngBounds(new google.maps.LatLng(37.2571419, -76.721611), new google.maps.LatLng(37.2867427, -76.6842753))
#options1 =
#  bounds: defaultBounds
#  types: ["geocode"]
#  componentRestrictions:
#    country: "us"
#
#autocomplete = new google.maps.places.Autocomplete($("#address")[0], [])
#autocomplete.setBounds(defaultBounds)
#google.maps.event.addListener autocomplete, "place_changed", ->
#  place = autocomplete.getPlace()
#  console.log place.address_components
$(document).ready ->
  GmapsAutoComplete.init()
  GmapsAutoComplete.autoCompleteInit
    region: "williamsburg"
    country: "us"
  return  #coffeescript otherwise returns the last line



#in order to autoload correct fields when editing
if $("#onCampus").is(":checked")
  $(".lf2 :input").removeAttr "disabled"
  $(".locationField1").slideToggle "fast"
  $(".locationField2").slideToggle "fast"


#for address field selection between on and off campus
jQuery ->
  $("#onCampus").on "click", (e) ->
    #if address 2 is hidden, enable it
    if ($(".locationField2").is(":hidden"))
      $('.lf2 :input').removeAttr('disabled')
    else
      $('.lf2 :input').attr('disabled', true)

    $(".locationField1").slideToggle "fast"
    $(".locationField2").slideToggle "fast"
