`import Ember from 'ember'`

QuizzIdInputController = Ember.Controller.extend
  quizzID: ""

  actions:
    goToQuizz: ->
      quizzId = @get('quizzID')

      if quizzId.length is 0
        alert("Please enter a quizz ID")
        return
      debugger

      success = (record) =>
        debugger
        record

      fail = (bla) =>
        alert("use mock ajax to do 404 here")
        debugger
        bla

      @store.find('quizz-event', quizzId).then(success, fail)

`export default QuizzIdInputController`
