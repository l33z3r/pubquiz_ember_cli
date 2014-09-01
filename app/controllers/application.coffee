`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend
  a: "b"

  iamhere: Ember.computed ->
    @get('phonegapHelperService').getMe()
  .property('bla')

  actions:
    vibrate: ->
      @get('phonegapHelperService').vibrate()

    doFBLogin: ->
      p = @get('phonegapHelperService').doFBLogin()

      success = =>
        alert("Success")

      failure = =>
        alert("Fail")

      p.then(success, failure)

`export default ApplicationController`
