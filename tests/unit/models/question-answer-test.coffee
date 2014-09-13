`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'question-answer', 'QuestionAnswer', {
# Specify the other units that are required for this test.
  needs: ['model:quiz-round-question']
}

test 'it exists', ->
  model = @subject()
  # store = @store()
  ok model
