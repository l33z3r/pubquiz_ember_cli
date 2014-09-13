`import Ember from 'ember'`

QuizRoundQuestions = Ember.Route.extend
  model: (params) ->
    #@store.findAll('quiz-event')
    Ember.A()

`export default QuizRoundQuestions`

