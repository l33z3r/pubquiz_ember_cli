`import Ember from 'ember'`

QuizEvents = Ember.Route.extend
  model: (params) ->
    if params.lat and params.lon
      @store.find('quiz-event', {lat: params.lat, lon: params.lon})
    else
      @store.findAll('quiz-event')

`export default QuizEvents`
