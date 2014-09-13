`import DS from 'ember-data'`

QuizEvent = DS.Model.extend
  name: DS.attr()
  startTime: DS.attr()

  quiz_rounds: DS.hasMany 'quiz-rounds'
  user: DS.belongsTo 'user'

`export default QuizEvent`

