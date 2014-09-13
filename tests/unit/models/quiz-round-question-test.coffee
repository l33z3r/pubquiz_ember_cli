`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'quiz-round-question', 'QuizRoundQuestion', {
# Specify the other units that are required for this test.
  needs: ['model:quiz-round', 'model:question-answer']
}

test 'it exists', ->
  model = @subject()
  # store = @store()
  ok model
