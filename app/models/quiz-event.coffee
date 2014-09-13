`import DS from 'ember-data'`

QuizEvent = DS.Model.extend
  name: DS.attr()
  startTime: DS.attr()

`export default QuizEvent`

