`import Ember from 'ember'`

QuizEvents = Ember.Route.extend
  model: (params) ->
    if params.x and params.y
      @store.find('quiz-event', {lat: params.x, long: params.y})
    else
      @store.findAll('quiz-event')

`export default QuizEvents`
