`import Ember from 'ember'`
`import Constants from '../utils/constants'`

RailsApiService = Ember.Object.extend
  getMe: ->
    "YESYSYSYSYSYSY"

  doRailsLogin: (accessToken) ->
    alert("indorailslogin")
    railsLoginURL = Constants.get('apiBaseURL') + "/auth/facebook/callback?access_token=" + accessToken

    console.log("Logging into rails with URL: #{railsLoginURL}")

    $.get railsLoginURL, (r) =>
      console.log("Login Rails returned " + r)

`export default RailsApiService`
