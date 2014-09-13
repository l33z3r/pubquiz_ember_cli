`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'submitted-answer', 'SubmittedAnswer', {
  # Specify the other units that are required for this test.
  needs: ['model:event-team-member']
}

test 'it exists', ->
  model = @subject()
  # store = @store()
  ok model
