`import DS from 'ember-data'`

User = DS.Model.extend
  name: DS.attr()
  email: DS.attr()

  quiz_event: DS.belongsTo('quiz-event')

  event_team_member: DS.belongsTo('event-team-member', {async: true})

`export default User`
