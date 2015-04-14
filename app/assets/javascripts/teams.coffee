# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  jQuery ($) ->
    $("#team_wins").change ->
      wins = $('#team_wins').val()
      otLosses = $('#team_otLosses').val()
      if parseInt(wins)
        $('#team_points').val((parseInt(wins) * 2 )+ (parseInt(otLosses) || 0))
      else
        $('#team_wins').val(0)
        $('#team_points').val((parseInt(otLosses) || 0))

    $("#team_otLosses").change ->
      wins = $('#team_wins').val()
      otLosses = $('#team_otLosses').val()
      if parseInt(otLosses)
        $('#team_points').val((parseInt(otLosses)) + ((parseInt(wins) * 2 ) || 0))
      else
        $('#team_otLosses').val(0)
        $('#team_points').val(((parseInt(wins) * 2 ) || 0))
$(document).ready(ready)
$(document).on('page:load', ready)
