`import DS from 'ember-data'`

QuestionAnswer = DS.Model.extend
  quiz_round_question: DS.belongsTo 'quiz-round-question'

`export default QuestionAnswer`
