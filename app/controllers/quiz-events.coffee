`import Ember from 'ember'`

QuizEventsController = Ember.ArrayController.extend
  needs: ['teams']

  a: "a"

  actions:
    quiz_event_selected: (qevent) ->
      #alert("Selected event #{qevent.get('name')}")

      #set the qevent id in the teams controller
      #this is messy
      @get('controllers.teams').set('current_quiz_event', qevent)
      @transitionToRoute('teams', qevent.get('id'))

`export default QuizEventsController`
