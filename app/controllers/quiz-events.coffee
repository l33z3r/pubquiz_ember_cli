`import Ember from 'ember'`

QuizEventsController = Ember.ArrayController.extend
  needs: ['teams']

  a: "a"

  actions:
    quiz_event_selected: (qevent) ->
      #alert("Selected event #{qevent.get('name')}")

      success = (qevent) =>
        #set the qevent id in the teams controller
        #this is messy
        @get('controllers.teams').set('current_quiz_event', qevent)
        @transitionToRoute('teams', qevent.get('id'))

      fail = (error) =>
        alert("No quiz found for that ID, try again")

      @store.find('quiz-event', qevent.get('id')).then(success, fail)

`export default QuizEventsController`
