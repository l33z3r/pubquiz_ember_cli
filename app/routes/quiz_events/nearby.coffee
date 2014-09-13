`import Ember from 'ember'`

QuizEventsNearby = Ember.Route.extend
  model: (params) ->
    @store.find('quiz-event', {lat: params.x, long: params.y})

`export default QuizEventsNearby`
