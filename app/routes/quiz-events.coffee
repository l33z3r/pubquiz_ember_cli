`import Ember from 'ember'`

QuizEvents = Ember.Route.extend
  model: (params) ->
    @store.findAll('quiz-event')

`export default QuizEvents`
