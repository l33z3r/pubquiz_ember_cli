`import Ember from 'ember'`

JoinQuizOptionsController = Ember.Controller.extend
  needs: ['teams']

  a: "b"

  actions:
    quizzesNearMe: ->
      func = (coords) =>
        console.log("Going to events for location #{coords}")
        lat = coords[1]
        lon = coords[0]
        @transitionToRoute('quiz_events', lat, lon)

      @get('phonegapHelperService').getGeoLoc(func, @)

    scanQuizIDQRCode: ->
      func = (quizId) ->
        console.log("!!!!!!Quiz Id: " + quizId)

        success = (qevent) =>
          #set the qevent id in the teams controller
          #this is messy
          @get('controllers.teams').set('current_quiz_event', qevent)
          @transitionToRoute('teams', quizId)

        fail = (bla) =>
          alert("No quiz found for that ID, try again")

        @store.find('quiz_event', quizId).then(success, fail)

      @get('phonegapHelperService').scanBarcode(func, @)

`export default JoinQuizOptionsController`
