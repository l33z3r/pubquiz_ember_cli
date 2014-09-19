`import Ember from 'ember'`

Team = Ember.Route.extend
  model: (params) ->
    debugger
    @store.find('team', { quiz_event_id: params.quiz_event_id })

`export default Team`
