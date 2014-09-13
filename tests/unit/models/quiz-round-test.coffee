`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'quiz-round', 'QuizRound', {
# Specify the other units that are required for this test.
  needs: ['model:quiz-round-question', 'model:quiz-event']
}

test 'it exists', ->
  model = @subject()
  # store = @store()
  ok model
