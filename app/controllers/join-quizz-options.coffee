`import Ember from 'ember'`

JoinQuizzOptionsController = Ember.Controller.extend
  needs: ['teams']

  a: "b"

  actions:
    scanQuizzIDQRCode: ->
      func = (quizzId) ->
        alert("Quizz Id: " + quizzId)

        success = (record) =>
          #set the qevent id in the teams controller
          #this is messy
          @get('controllers.teams').set('quizz_event_id', quizzId)
          @transitionToRoute('teams', quizzId)

        fail = (bla) =>
          alert("No quizz found for that ID, try again")

        @store.find('quizz_event', quizzId).then(success, fail)

      @get('phonegapHelperService').scanBarcode(func, @)

`export default JoinQuizzOptionsController`
