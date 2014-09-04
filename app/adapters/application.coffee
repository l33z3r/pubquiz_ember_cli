`import DS from 'ember-data'`
`import Constants from '../utils/constants'`

ApplicationAdapter = DS.ActiveModelAdapter.extend
  host: Constants.get('apiBaseURL')
  namespace: "api"

`export default ApplicationAdapter`
