`import DS from 'ember-data'`

CurrentUserInitializer =
  name: 'current-user'
  after: 'store'

  # container, app is passed to initialize - add if you need them (you probably do)
  initialize: (container, app) ->
    # app.register 'route', 'foo', 'service:foo'
    store = container.lookup('store:main')

    $.getJSON(window.PubquizENV.RAILS_API_SERVER_URL + "/api/v1/users/current_user").then (result) =>
      attributes =
        id: result.user.id
        name: result.user.name
        email: result.user.email
        event_team_member: result.user.event_team_member

      user = store.push('user', attributes)
      controller = container.lookup('controller:currentUser').set('content', user)

`export default CurrentUserInitializer`
