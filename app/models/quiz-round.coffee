`import DS from 'ember-data'`

QuizRound = DS.Model.extend
  quiz: DS.belongsTo 'quiz-event'
  quiz_round_questions: DS.hasMany 'quiz-round-question'

`export default QuizRound`
