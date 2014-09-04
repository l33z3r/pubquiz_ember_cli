`import Ember from 'ember'`

TeamsController = Ember.ArrayController.extend
  quizz_event_id: null

  actions:
    team_selected: (team) ->
      alert("Joining team #{team.get('name')}")

      #create membership ajax goes here

      @transitionToRoute('quizz_event', @get('quizz_event_id'))

`export default TeamsController`
