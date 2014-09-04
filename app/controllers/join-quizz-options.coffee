`import Ember from 'ember'`

JoinQuizzOptionsController = Ember.Controller.extend
  a: "b"

  actions:
    scanQuizzIDQRCode: ->
      func = (val) ->
        alert("Val: " + val)
      #the context here is callback.call(@, .... in phonegaphelper

      @get('phonegapHelperService').scanBarcode(func)

`export default JoinQuizzOptionsController`
