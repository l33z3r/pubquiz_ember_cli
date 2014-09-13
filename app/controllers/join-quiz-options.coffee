`import Ember from 'ember'`

JoinQuizOptionsController = Ember.Controller.extend
  needs: ['teams']

  a: "b"

  actions:
    scanQuizIDQRCode: ->
      func = (quizId) ->
        console.log("!!!!!!Quiz Id: " + quizId)

        success = (record) =>
          #set the qevent id in the teams controller
          #this is messy
          @get('controllers.teams').set('quiz_event_id', quizId)
          @transitionToRoute('teams', quizId)

        fail = (bla) =>
          alert("No quiz found for that ID, try again")

        @store.find('quiz_event', quizId).then(success, fail)

      @get('phonegapHelperService').scanBarcode(func, @)

`export default JoinQuizOptionsController`
