`import DS from 'ember-data'`

Team = DS.Model.extend
  name: DS.attr()
  event_team_members: DS.hasMany 'event-team-member'

`export default Team`
