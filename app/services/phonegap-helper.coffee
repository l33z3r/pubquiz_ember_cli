`import Ember from 'ember'`
`import Constants from '../utils/constants'`

PhonegapHelperService = Ember.Object.extend
  getMe: ->
    "#{Constants.get('apiBaseURL')}Me"

  vibrate: (millis) ->
    @doConditionalPGAction =>
      navigator.notification.vibrate(millis)

  doFBLogin: ->
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
          console.log("Error logging into FB: " + e)
          reject()

      @doConditionalPGAction(fbLoginFunc)

    new Ember.RSVP.Promise(promiseFunc)

  scanBarcode: (callback, context) ->
#    #TODO: remove this, it is only for testing on web browser
#    callback.call(context, "zzz");
#    return

    func = =>
      successFunc = (result) =>
        alert("We got a barcode\n" +
        "Result: " + result.text + "\n" +
        "Format: " + result.format + "\n" +
        "Cancelled: " + result.cancelled)

        callback.call(context, result.text)

      errorFunc = (error) =>
        alert("Scanning failed: " + error);

      cordova.plugins.barcodeScanner.scan(successFunc, errorFunc)

    @doConditionalPGAction(func)

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
