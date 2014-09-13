`import DS from 'ember-data'`

QuizRoundQuestion = DS.Model.extend
  quiz_round: DS.belongsTo 'quiz-round'
  question_answers: DS.hasMany 'question-answers'

`export default QuizRoundQuestion`
