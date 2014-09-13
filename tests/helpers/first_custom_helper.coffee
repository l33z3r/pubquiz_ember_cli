`import Ember from 'ember'`

FirstCustomHelper = Ember.Test.registerHelper 'firstCustomHelper', (app, selector, n, context) ->
  x = 1
  debugger

`export default FirstCustomHelper`