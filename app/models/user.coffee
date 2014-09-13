`import DS from 'ember-data'`

User = DS.Model.extend {
  name: DS.attr()
  current_quiz: DS.belongsTo('quiz-event')
}

`export default User`
