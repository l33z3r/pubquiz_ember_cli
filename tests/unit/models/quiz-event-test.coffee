`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'quiz-event', 'QuizEvent', {
# Specify the other units that are required for this test.
  needs: ['model:user', 'model:quiz-round']
}

test 'it exists', ->
  model = @subject()
  # store = @store()
  ok model
