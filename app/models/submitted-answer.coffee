`import DS from 'ember-data'`

SubmittedAnswer = DS.Model.extend
  event_team_member: DS.belongsTo 'event-team-member'

`export default SubmittedAnswer`
