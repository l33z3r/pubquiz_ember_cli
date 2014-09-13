`import Ember from 'ember'`

QuizRounds = Ember.Route.extend
  model: ->
    @store.findAll('quiz-round')

`export default QuizRounds`
