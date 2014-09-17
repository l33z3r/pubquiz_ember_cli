`import Ember from 'ember'`
`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`

Ember.MODEL_FACTORY_INJECTIONS = true

App = Ember.Application.extend
  modulePrefix: 'pubquiz', # TODO: loaded via config
  Resolver: Resolver

  #ember-pusher setup
  PUSHER_OPTS:
    key: 'e6bb42c17b827adbf664'
    connection: {}
    logAllEvents: true

loadInitializers(App, 'pubquiz')

`export default App`
