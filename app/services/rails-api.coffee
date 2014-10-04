`import Ember from 'ember'`
`import Constants from '../utils/constants'`

RailsApiService = Ember.Object.extend

  doRailsLogin: (accessToken) ->
    promiseFunc = (resolve, reject) =>
      try
        console.log("indorailslogin")

        railsLoginURL = window.PubquizENV.RAILS_API_SERVER_URL + "/auth/facebook/callback?access_token=" + accessToken

        console.log("Logging into rails with URL: #{railsLoginURL}")

        railsLoginSuccess = (res) =>
          console.log("Login Rails success")
          resolve()

        railsLoginFailure = =>
          reject()

        $.ajax
          url: railsLoginURL
          success: railsLoginSuccess
          fail: railsLoginFailure

      catch e
        console.error(e.stack)
        console.log("Error logging into rails: " + e)
        reject()

    new Ember.RSVP.Promise(promiseFunc)

`export default RailsApiService`
