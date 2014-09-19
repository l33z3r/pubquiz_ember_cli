`import Ember from 'ember'`
`import Constants from '../utils/constants'`
`import SettingsConstants from '../utils/settings-constants'`

ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    sa = @store.createRecord('submitted_answer', {id: 1, bla: "bla"})
    sa.save()

    p = @store.find('quiz-event', "q1")

    success = (qe) ->
      console.log("Found test record: #{qe.get('name')}")

    fail = =>
      console.log("Error finding test record")

    p.then(success, fail)

    @store.find('setting', SettingsConstants.apiURLToUse).then null, (reason) =>
      console.log("Creating setting record")
      record = @store.recordForId('setting', SettingsConstants.apiURLToUse)
      record.loadedData()

      properties =
        val: Constants.apiBaseURL

      record.setProperties(properties)
      record.save()

`export default ApplicationRoute`
