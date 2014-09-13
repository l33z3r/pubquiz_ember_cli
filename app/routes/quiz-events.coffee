`import Ember from 'ember'`

QuizEvents = Ember.Route.extend
  model: ->
    @store.findAll('quiz-event')

`export default QuizEvents`
