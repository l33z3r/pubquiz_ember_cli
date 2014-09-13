`import Ember from 'ember'`

QuizEvent = Ember.Route.extend
  model: (params) ->
    @store.find('quiz-event', params.quiz_event_id)

`export default QuizEvent`
