`import Ember from 'ember'`
`import Constants from '../utils/constants'`
`import SettingsConstants from '../utils/settings-constants'`

ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    Ember.run.schedule "afterRender", =>
      controller.doUserInit()

`export default ApplicationRoute`
