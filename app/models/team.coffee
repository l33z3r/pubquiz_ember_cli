`import DS from 'ember-data'`

Team = DS.Model.extend
  quiz_event: DS.belongsTo 'quiz-event', {async: true}
  name: DS.attr()
  event_team_members: DS.hasMany 'event-team-member', {async: true}

`export default Team`
