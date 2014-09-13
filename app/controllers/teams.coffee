`import Ember from 'ember'`

TeamsController = Ember.ArrayController.extend
  quiz_event_id: null

  actions:
    team_selected: (team) ->
      alert("Joining team #{team.get('name')}")

      #create membership ajax goes here

      @transitionToRoute('quiz_event', @get('quiz_event_id'))

`export default TeamsController`
