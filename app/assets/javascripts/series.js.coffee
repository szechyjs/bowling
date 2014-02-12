$(document).on 'page:change', ->
  $('#series_team_id').parent().parent().hide()
  teams = $('#series_team_id').html()
  $('#series_league_id').change ->
    league = $('#series_league_id :selected').text()
    escaped_league = league.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(teams).filter("optgroup[label='#{escaped_league}']").html()
    if options
      $('#series_team_id').html(options)
      $('#series_team_id').parent().parent().show()
    else
        $('#series_team_id').empty()
        $('#series_team_id').parent().parent().hide()
