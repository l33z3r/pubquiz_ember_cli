`import Ember from 'ember'`

Router = Ember.Router.extend
  location: PubquizENV.locationType

Router.map ->
  @route('nearby-quizzes')


`export default Router`
