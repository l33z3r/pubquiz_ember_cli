`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    p = this.store.find('quizz_event', "q1");

    success = (qe) ->
      console.log("Found test record: #{qe.get('name')}")

    fail = =>
      console.log("Error finding test record")

    p.then(success, fail);

`export default ApplicationRoute`
