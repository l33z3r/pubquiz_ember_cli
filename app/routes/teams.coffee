`import Ember from 'ember'`

Team = Ember.Route.extend
  model: (params) ->
    @store.find('team', params.team_id)

`export default Team`
