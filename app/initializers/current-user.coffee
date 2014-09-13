`import DS from 'ember-data'`

CurrentUserInitializer =
  name: 'current-user'
  after: 'store'

  # container, app is passed to initialize - add if you need them (you probably do)
  initialize: (container, app) ->
    # app.register 'route', 'foo', 'service:foo'
    store = container.lookup('store:main')

    attributes =
      id: "main_user"
      name: "Lee"

    if attributes
      user = store.push('user', attributes)
      controller = container.lookup('controller:currentUser').set('content', user)

`export default CurrentUserInitializer`
