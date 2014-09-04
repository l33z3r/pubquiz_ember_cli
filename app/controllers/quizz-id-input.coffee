`import Ember from 'ember'`

QuizzIdInputController = Ember.Controller.extend
  needs: ['teams']

  quizzID: ""

  actions:
    goToQuizz: ->
      quizzId = @get('quizzID')

      if quizzId.length is 0
        alert("Please enter a quizz ID")
        return

      success = (record) =>
        #set the qevent id in the teams controller
        #this is messy
        @get('controllers.teams').set('quizz_event_id', quizzId)
        @transitionToRoute('teams', quizzId)

      fail = (bla) =>
        alert("No quizz found for that ID, try again")

      @store.find('quizz_event', quizzId).then(success, fail)

`export default QuizzIdInputController`
