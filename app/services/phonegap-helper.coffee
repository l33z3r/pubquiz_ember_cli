`import Ember from 'ember'`

PhonegapHelperService = Ember.Object.extend
  getMe: ->
    "Me"

  vibrate: (millis) ->
    @doConditionalPGAction =>
      navigator.notification.vibrate(millis)

  doFBLogin: (loginPromise) ->
    promiseFunc = (resolve, reject) =>
      fbLoginFunc = =>
        try
          FB.init
            cookie:true,
            appId: "339202539580669",
            nativeInterface: CDV.FB,
            useCachedDialogs: false

          responseFunc = (response) =>
            if response.status is'connected'
              console.log('logged in, got access token: ' + response.authResponse.accessToken)
              resolve(response.authResponse.accessToken)
            else
              console.log('not logged in')
              reject()

          scopes =
            scope: "email,user_friends"

          FB.login(responseFunc, scopes)

        catch e
          console.log("Error loggin into FB: " + e)
          reject()

      @doConditionalPGAction(fbLoginFunc)

    new Ember.RSVP.Promise(promiseFunc)

  doConditionalPGAction: (func) ->
    if cordova? or Phonegap? or phonegap?
      try
        func.call()
      catch e
        console.log("Error running phonegap code " + e)
    else
      msg = "Phonegap lib not available"
      console.log(msg)
      alert(msg)

`export default PhonegapHelperService`
