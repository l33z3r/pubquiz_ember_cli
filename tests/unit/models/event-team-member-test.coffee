`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'event-team-member', 'EventTeamMember', {
  # Specify the other units that are required for this test.
  needs: ['model:team', 'model:user', 'model:submitted-answer']
}

test 'it exists', ->
  model = @subject()
  # store = @store()
  ok model
