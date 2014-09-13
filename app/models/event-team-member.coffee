`import DS from 'ember-data'`

EventTeamMember = DS.Model.extend
  team: DS.belongsTo 'team'
  user: DS.belongsTo 'user'
  submitted_answers: DS.hasMany 'submitted-answer'

`export default EventTeamMember`
