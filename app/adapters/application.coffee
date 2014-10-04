`import DS from 'ember-data'`
`import Constants from '../utils/constants'`

ApplicationAdapter = DS.ActiveModelAdapter.extend
  host: window.PubquizENV.RAILS_API_SERVER_URL
  namespace: "api/v1"

`export default ApplicationAdapter`
