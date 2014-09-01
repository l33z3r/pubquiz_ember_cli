PhonegapHelperInitializer =
  name: 'phonegap-helper-service'
  initialize: (container, app) ->
    app.inject 'route', 'phonegapHelperService', 'service:phonegap-helper'
    app.inject 'controller', 'phonegapHelperService', 'service:phonegap-helper'

`export default PhonegapHelperInitializer`
