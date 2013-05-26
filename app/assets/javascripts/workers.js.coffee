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
  GmapsAutoComplete.init
    inputField: '#gmaps-input-address',
    errorField: '#gmaps-error'
  GmapsAutoComplete.autoCompleteInit
    region: "williamsburg"
    country: "us"
  return  #coffeescript otherwise returns the last line

#secondFieldptions
#  inputField: '#gmaps-input-address2',
#  errorField: '#gmaps-error2'

$(document).ready ->
  GmapsAutoComplete.init
    inputField: '#2gmaps-input-address',
    errorField: '#2gmaps-error'
  GmapsAutoComplete.autoCompleteInit
    region: "williamsburg"
    country: "us"
  return  #coffeescript otherwise returns the last line





