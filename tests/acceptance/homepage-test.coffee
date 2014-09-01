`import Ember from 'ember'`
`import startApp from '../helpers/start-app'`

App = null

module 'Acceptance: Homepage',
  setup: ->
    App = startApp()

  teardown: ->
    Ember.run App, 'destroy'

test 'visiting /homepage', ->
  visit '/'

  andThen ->
    equal currentPath(), 'index'
