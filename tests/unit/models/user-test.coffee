`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'user', 'User', {
  # Specify the other units that are required for this test.
  needs: ['model:quiz-event', 'model:event-team-member']
}

test 'it exists', ->
  model = @subject()
  # store = @store()
  ok model
