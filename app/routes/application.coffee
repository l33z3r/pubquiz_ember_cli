`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    sa = this.store.createRecord('submitted_answer', {id: 1, bla: "bla"})
    sa.save()

    p = this.store.find('quiz-event', "q1")

    success = (qe) ->
      console.log("Found test record: #{qe.get('name')}")

    fail = =>
      console.log("Error finding test record")

    p.then(success, fail)

`export default ApplicationRoute`
