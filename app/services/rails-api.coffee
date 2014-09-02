`import Ember from 'ember'`
`import Constants from '../utils/constants'`

RailsApiService = Ember.Object.extend
  doRailsLogin: (accessToken) ->
    railsLoginURL = Constants.get('apiBaseURL') + "/auth/facebook/callback?access_token=" + accessToken

    $.get railsLoginURL, (r) =>
      console.log("Login Rails returned " + r)

`export default RailsApiService`
