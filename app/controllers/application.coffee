`import Ember from 'ember'`
`import Constants from '../utils/constants'`
`import GlobalVars from '../utils/global_vars'`

ApplicationController = Ember.Controller.extend EmberPusher.Bindings,
  PUSHER_SUBSCRIPTIONS:
    modelupdatechannel: ['model-updated']

  a: "b"

  iamhere: Ember.computed ->
    Constants.get('apiBaseURL') + @get('railsApiService').getMe() + @get('phonegapHelperService').getMe()
  .property('bla')

  actions:
    modelUpdated: (data) ->
      alert("model-updated")
      debugger

      try
        data = JSON.parse(data)
        modelType = data.modelType
        modelData = data.modelData

        #eg store.update('person', {name: "lee"})
        @store.update(modelType, modelData)
      catch
        alert("Xepshion")

`export default ApplicationController`
