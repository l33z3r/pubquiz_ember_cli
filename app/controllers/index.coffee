`import Ember from 'ember'`
`import Constants from '../utils/constants'`
`import GlobalVars from '../utils/global_vars'`

IndexController = Ember.Controller.extend
  needs: ["current-user"]
  #queryParams: ["hello"]

  actions:
    joinQuiz: ->
      #alert(@get('hello'))

      console.log("Current user is #{@get('controllers.current-user.model.name')}")

      p = @get('phonegapHelperService').getFBLoginStatus()

      success = (loggedIn) =>
        if loggedIn
          @send('goToQuizOptions')
        else
          success = (result) =>
            @send('goToQuizOptions')

          failure = =>
            alert("Failurrrrrrr")

          @doFBLogin().then(success, failure)

      failure = =>
        alert("Fail get login status")

      p.then(success, failure)

    goToQuizOptions: ->
      Ember.run.later =>
        @transitionToRoute('join_quiz_options')
      , 50

      @get('phonegapHelperService').doCurlTransition()

    vibrate: ->
      @get('phonegapHelperService').vibrate(3000)

  doFBLogin: ->
    console.log("V4")

    promiseFunc = (resolve, reject) =>
      p = @get('phonegapHelperService').doFBLogin()

      railsAPIService = @get('railsApiService')

      success = (authToken) =>
        GlobalVars.set('fbAuthToken', authToken)

        console.log("Stored access token, logging into rails")

        alert(railsAPIService)

        railsAPIService.doRailsLogin(authToken)

        alert("after")
        resolve()

      failure = =>
        alert("Fail")
        reject()

      p.then(success, failure)

    new Ember.RSVP.Promise(promiseFunc)

`export default IndexController`
