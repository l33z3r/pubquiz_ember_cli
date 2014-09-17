`import Ember from 'ember'`

QuizIdInputController = Ember.Controller.extend
  needs: ['teams']

  quizID: ""

  actions:
    goToQuiz: ->
      quizId = @get('quizID')

      if quizId.length is 0
        alert("Please enter a quiz ID")
        return

      success = (qevent) =>
        #set the qevent id in the teams controller
        #this is messy
        @get('controllers.teams').set('current_quiz_event', qevent)
        @transitionToRoute('teams', quizId)

      fail = (bla) =>
        alert("No quiz found for that ID, try again")

      @store.find('quiz-event', quizId).then(success, fail)

`export default QuizIdInputController`
