`import Ember from 'ember'`

QuizzEventsController = Ember.ArrayController.extend
  needs: ['teams']

  a: "a"

  actions:
    quizz_event_selected: (qevent) ->
      #alert("Selected event #{qevent.get('name')}")

      #set the qevent id in the teams controller
      #this is messy
      @get('controllers.teams').set('quizz_event_id', qevent.get('id'))
      @transitionToRoute('teams', qevent.get('id'))

`export default QuizzEventsController`
