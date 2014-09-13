`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:join-quiz-options', 'JoinQuizOptionsController', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']

  needs: ['controller:teams']
}

# Replace this with your real tests.
test 'it exists', ->
  controller = @subject()
  ok controller

