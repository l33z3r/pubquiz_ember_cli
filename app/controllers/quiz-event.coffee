`import Ember from 'ember'`

QuizEventController = Ember.ObjectController.extend
  teams: DS.hasMany 'team'

`export default QuizEventController`
