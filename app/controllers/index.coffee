`import Ember from 'ember'`
`import Constants from '../utils/constants'`
`import GlobalVars from '../utils/global_vars'`

IndexController = Ember.Controller.extend
  needs: ["current-user"]
  #queryParams: ["hello"]

  actions:
    vibrate: ->
      @get('phonegapHelperService').vibrate(3000)

`export default IndexController`
