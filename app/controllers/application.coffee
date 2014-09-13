`import Ember from 'ember'`
`import Constants from '../utils/constants'`
`import GlobalVars from '../utils/global_vars'`

ApplicationController = Ember.Controller.extend
  a: "b"

  iamhere: Ember.computed ->
    Constants.get('apiBaseURL') + @get('railsApiService').getMe() + @get('phonegapHelperService').getMe()
  .property('bla')

`export default ApplicationController`
