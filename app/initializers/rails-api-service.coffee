RailsApiInitializer =
  name: 'rails-api-service'
  initialize: (container, app) ->
    app.inject 'route', 'railsApiService', 'service:rails-api'
    app.inject 'controller', 'railsApiService', 'service:rails-api'

`export default RailsApiInitializer`
