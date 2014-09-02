`import Ember from 'ember'`
`import Constants from '../utils/constants'`
`import GlobalVars from '../utils/global_vars'`

ApplicationController = Ember.Controller.extend
  a: "b"

  iamhere: Ember.computed ->
    Constants.get('apiBaseURL') + @get('phonegapHelperService').getMe()
  .property('bla')

  actions:
    vibrate: ->
      @get('phonegapHelperService').vibrate(3000)

    scanBarcode: ->
      func = (val) ->
        alert("Val: " + val)
        @get('phonegapHelperService').vibrate(1000)

      @get('phonegapHelperService').scanBarcode(func)

    doFBLogin: ->
      p = @get('phonegapHelperService').doFBLogin()

      success = (authToken) =>
        alert("Success1")
        GlobalVars.set('fbAuthToken', authToken)
        alert("Success")

        console.log("Stored access token, logging into rails")

        @get('railsApiService').doRailsLogin(accessToken)

      failure = =>
        alert("Fail")

      p.then(success, failure)

`export default ApplicationController`
