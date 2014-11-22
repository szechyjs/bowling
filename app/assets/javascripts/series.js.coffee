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

  $('#series_bowler_id, #series_league_id, #series_team_id').change ->
    bowler = $('#series_bowler_id').val()
    league = $('#series_league_id').val()
    team = $('#series_team_id').val()
    if bowler and league and team
      $.ajax
        url: '/series/next_week'
        data:
          bowler: bowler
          league: league
          team: team
        dataType: 'script'
