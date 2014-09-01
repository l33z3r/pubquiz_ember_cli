`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'service:phonegap-helper', 'PhonegapHelperService', {
  # Specify the other units that are required for this test.
  # needs: ['service:foo']
}

# Replace this with your real tests.
test 'it exists', ->
  service = @subject()
  ok service
