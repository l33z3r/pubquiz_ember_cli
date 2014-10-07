`import Ember from 'ember'`
`import Constants from '../utils/constants'`
`import GlobalVars from '../utils/global_vars'`

ApplicationController = Ember.Controller.extend EmberPusher.Bindings,
  needs: ["current-user", 'quiz-event/landing']

  PUSHER_SUBSCRIPTIONS:
    modelupdatechannel: ['model-updated']

  userInit: true

  doUserInit: ->

    p = @ensureFBLogin()

    success = =>
      railsAPIService = @get('railsApiService')

      #contact the rails app
      authToken = GlobalVars.get('fbAuthToken')

      console.log("logging into rails")

      railsLoginPromise = railsAPIService.doRailsLogin(authToken)

      railsLoginSuccess = =>
        $.getJSON(window.PubquizENV.RAILS_API_SERVER_URL + "/api/v1/users/current_user").then (result) =>
          attributes =
            id: result.user.id
            name: result.user.name
            email: result.user.email
            event_team_member: result.user.event_team_member_id

          user = @store.push('user', attributes)
          console.log("Current user is #{user.get('name')}")

          @get('controllers.current-user').set('content', user)

          #load users current quiz
          if user.get('event_team_member')?
            user.get('event_team_member').then (etm) =>
              console.log("user already part of a team")

              etm.get('team').then (team) =>
                team.get('quiz_event').then (qevent) =>
                  alert("Going to quiz #{qevent.get('id')}")
                  @get('controllers.quiz-event/landing').set('currentTeam', team)
                  @transitionToRoute('quiz_event.landing', qevent)
          else
            @goToQuizOptions()

          @set('userInit', false)

      railsLoginFailure = =>
        console.log("rails login failure")

      railsLoginPromise.then(railsLoginSuccess, railsLoginFailure)

    failure = =>
      alert("Fail ensure fb login")

    p.then(success, failure)

  ensureFBLogin: ->
    promiseFunc = (resolve, reject) =>
      try
        p = @get('phonegapHelperService').getFBLoginStatus()

        success = (authToken) =>
          if authToken?
            console.log("already logged in")
            #must set auth token here before resolving
            GlobalVars.set('fbAuthToken', authToken)
            resolve()
          else
            success = (result) =>
              resolve()

            failure = =>
              alert("Failure")
              reject()

            @doFBLogin().then(success, failure)

        failure = (f) =>
          alert("Fail get login status")
          reject()

        p.then(success, failure)

      catch e
        console.error(e.stack)
        console.log("Error emsureing fb login: " + e)
        reject()

    new Ember.RSVP.Promise(promiseFunc)

  doFBLogin: ->
    console.log("V4")

    promiseFunc = (resolve, reject) =>
      try
        p = @get('phonegapHelperService').doFBLogin()

        success = (authToken) =>
          GlobalVars.set('fbAuthToken', authToken)
          console.log("Stored access token")
          resolve()

        failure = =>
          alert("Fail")
          reject()

        p.then(success, failure)
      catch e
        console.error(e.stack)
        console.log("Error in code to log in to fb: " + e)
        reject()

    new Ember.RSVP.Promise(promiseFunc)

  goToQuizOptions: ->
    Ember.run.later =>
      @transitionToRoute('join_quiz_options')
    , 50

    @get('phonegapHelperService').doCurlTransition()

  actions:

    modelUpdated: (data) ->
      alert("model-updated")
      debugger

      try
        data = JSON.parse(data)
        modelType = data.modelType
        modelData = data.modelData

        #eg store.update('person', {name: "lee"})
        @store.update(modelType, modelData)
      catch
        alert("Xepshion parsing pusher data")

`export default ApplicationController`
