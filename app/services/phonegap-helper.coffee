`import Ember from 'ember'`
`import Constants from '../utils/constants'`

PhonegapHelperService = Ember.Object.extend
  getMe: ->
    "Me"

  vibrate: (millis) ->
    @doConditionalPGAction =>
      navigator.notification.vibrate(millis)

  doFBLogin: ->
    promiseFunc = (resolve, reject) =>
      try
        if !@havePhonegap()
          mockedAuthToken = "CAAE0gL7g7P0BAMLLOa42F2b9ZArndymuMC2ctux2hlsSH6saTY9Ogosi8DVe0tCml53KBvhGQ5xEyOrrAEGIPjkvZCP0AhMDRrwLNcZAPYCHBxJyi2hIP3RX2YhZCUd1egIdCS5kwFyRxErZCrTUUwdOmcyZBaan5qVa3tP6RZBlvvSqCzZBHYeBWfUtZBsorXN63SiO9ChZCf3PcvgbquiqI61A6pGqE4ll6Kes3JuYF99gZDZD"
          console.log("mocking FB Login with access token #{mockedAuthToken}")
          resolve(mockedAuthToken)
        else
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
        console.error(e.stack)
        console.log("Error in code to log in to fb: " + e)
        reject()

    new Ember.RSVP.Promise(promiseFunc)

  getFBLoginStatus: ->
    promiseFunc = (resolve, reject) =>
      try
        if !@havePhonegap()
          mockLoginAsTrue = false

          if mockLoginAsTrue
            console.log("mocking login status as true")
            mockedAuthToken = "CAAE0gL7g7P0BAMLLOa42F2b9ZArndymuMC2ctux2hlsSH6saTY9Ogosi8DVe0tCml53KBvhGQ5xEyOrrAEGIPjkvZCP0AhMDRrwLNcZAPYCHBxJyi2hIP3RX2YhZCUd1egIdCS5kwFyRxErZCrTUUwdOmcyZBaan5qVa3tP6RZBlvvSqCzZBHYeBWfUtZBsorXN63SiO9ChZCf3PcvgbquiqI61A6pGqE4ll6Kes3JuYF99gZDZD"
            resolve(mockedAuthToken)
          else
            console.log("mocking login status as false")
            resolve(null)
        else
          alert("init")
          FB.init
            cookie:true,
            appId: "339202539580669",
            nativeInterface: CDV.FB,
            useCachedDialogs: false
          alert("after init")
          FB.getLoginStatus (response) =>
            alert("got login resp #{response.status}")
            if response.status is 'connected'
              resolve(response.authResponse.accessToken)
            else
              resolve(null)
      catch e
        console.error(e.stack)
        console.log("Error getting login status from FB: " + e)
        reject()

    new Ember.RSVP.Promise(promiseFunc)

  doCurlTransition: (callback) ->
    if !@havePhonegap() or device.platform isnt "iOS"
      console.log("skipping curl transition as in browser")

      if callback?
        callback.call()

    else
      nativetransitions.curl(0.5, "down", callback)

  scanBarcode: (callback, context) ->
    if !@havePhonegap()
      console.log("mocking barcode scan with value zzz")
      callback.call(context, "zzz")
    else
      successFunc = (result) =>
        console.log("We got a barcode\n" +
        "Result: " + result.text + "\n" +
        "Format: " + result.format + "\n" +
        "Cancelled: " + result.cancelled)

        callback.call(context, result.text)

      errorFunc = (error) =>
        alert("Scanning failed: " + error);

      cordova.plugins.barcodeScanner.scan(successFunc, errorFunc)

  getGeoLoc: (callback, context) ->
    if !@havePhonegap()
      if navigator.geolocation
        console.log("getting browser coords as pg not available")

        coordsCallback = (position) =>
          x = position.coords.longitude
          y = position.coords.latitude

          console.log("got browser coords (#{x}, #{y})")
          callback.call(context, [x, y])

        navigator.geolocation.getCurrentPosition(coordsCallback)
      else
        console.log("mocking geo loc with location Dublin (51.5033630,-0.1276250)")
        callback.call(context, [51.5033630,-0.1276250])
    else
      onSuccess = (position) =>
        console.log('Latitude: '          + position.coords.latitude          + '\n' +
          'Longitude: '         + position.coords.longitude         + '\n' +
          'Altitude: '          + position.coords.altitude          + '\n' +
          'Accuracy: '          + position.coords.accuracy          + '\n' +
          'Altitude Accuracy: ' + position.coords.altitudeAccuracy  + '\n' +
          'Heading: '           + position.coords.heading           + '\n' +
          'Speed: '             + position.coords.speed             + '\n' +
          'Timestamp: '         + position.timestamp                + '\n')

        x = position.coords.longitude
        y = position.coords.latitude

        callback.call(context, [x, y])

      onError = (error) =>
        alert('code: '    + error.code    + '\n' +
          'message: ' + error.message + '\n')

        callback.call(null)

      navigator.geolocation.getCurrentPosition(onSuccess, onError)

  havePhonegap: ->
    cordova? or Phonegap? or phonegap?

`export default PhonegapHelperService`
