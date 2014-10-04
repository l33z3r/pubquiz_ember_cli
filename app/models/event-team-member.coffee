`import DS from 'ember-data'`

EventTeamMember = DS.Model.extend
  team: DS.belongsTo 'team', {async: true}
  user: DS.belongsTo 'user', {async: true}
  submitted_answers: DS.hasMany 'submitted-answer'

`export default EventTeamMember`
